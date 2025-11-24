  //////////////
 // Isolates //
//////////////
/// Dart is single threaded and runs on the main isolate (single thread runing on 1 core)
/// When a computation is large enough to make an app unresponsive a new isolate can be spawned that will run on a separate core to do this work (see Concurrency.dart for more details)
/// New isolates spawned using Isolate.run() or Isolate.spawn() will be in the same isolate group as the main isolate meaning they share the same code (worker can use all the functions, classes etc. from apps codebase)
/// useful for:
  /// Parsing and decoding exceptionally large JSON blobs
  /// Processing and compressing photos, audio and video
  /// Converting audio and video files
  /// Performing complex searching and filtering on large lists or within file systems
  /// Performing I/O, such as communicating with a database
  /// Handling a large volume of network requests
import "dart:async";
import "dart:isolate";
import "dart:convert";
import "dart:io";



// Isolate.run()
// This is very simple to use as it only spawns an isolate to perform a single computation (run a single funciton) and then closes it
// It should be used when you have you have a large task one off tasks that would make the UI unresponsive
void isolateRun() async {
  final jsonData = await Isolate.run(()=>readAndParseJson('file.json'));         // calls new isolate, passes the readAndParseJson function to it and then awaits it's results
  print('Number of JSON keys: ${jsonData.length}');                              // The isolate will run the function and returns the results
}

Future<Map<String, dynamic>> readAndParseJson(String filename) async {
  final fileData = await File(filename).readAsString();
  return  jsonDecode(fileData) as Map<String, dynamic>;
}


// [Compute in Flutter]?



// Isolate.spawn()
// Create a more long lived isolate that can handle multiple messages over time, and perform the same computation repeadilty without the overhead of creating a new Isolate every time
// Isolated created using .spawn have the same executable code and are in the same isolate group enabling them to access the same code and immutable data
class Worker {
  final SendPort _commands;                                       // worker isolate's SendPort
  final ReceivePort _responses;                                   // main isolate's ReceivePort
  final Map<int, Completer<Object?>> _activeRequests = {};        // Map of active requests with each one having a integer id key to identify/access it
  int _idCounter = 0;                                             // id counter 
  bool _closed = false;                                           // whether the worker Object is closed or not (allows finishing of active requests before closing worker isolate)

  Future<Object?> parseJson(String message) async {               // takes in a 
    if (_closed) throw StateError('Closed');                      // if a new command is being send to the worker Isolate even though the Worker object is closed throw an error
    final completer = Completer<Object?>.sync();                  // create a synchronous completer
    final id = _idCounter++;                                      // increment id so all ids are unique
    _activeRequests[id] = completer;                              // add completer to _activeRequests Map with id as the key
    _commands.send((id, message));                                // sends a record containing the id and the message (can only send 1 value through sendPort)
    return await completer.future;                                //  return the completer.future which will = response from the worker isolate once _handleResponsesFromIsolate() is finished running
  }

  // Handles all setup of ports and spawning new isolates making code to create a Worker object clean
  static Future<Worker> spawn() async {
    final initPort = RawReceivePort();                                                          // create the RawReceivePort for our main isolate
    final connection = Completer<(ReceivePort, SendPort)>.sync();                               // create a synchronous Completer

    initPort.handler = (initialMessage) {                                                       // set the RawReceivePort's handler so when the it gets it's first message from the worker isolate it will:
      final commandPort = initialMessage as SendPort;                                           // save the SendPort the worker sends
      connection.complete((ReceivePort.fromRawReceivePort(initPort),commandPort,));             // resolve the connection completer to (our RawReceivePort converted to ReceivePort, workers SendPort)
    };

    try {
      await Isolate.spawn(_startRemoteIsolate, (initPort.sendPort));                            // spawn worker isolate with reference to function that it should run when it starts and the RawReceivePort's SendPort
    } on Object {                                                                               // if spawning an isolate throws and error:
      initPort.close();                                                                         // close the RawReceivePort
      rethrow;                                                                                  // and rethrow
    }

    // runs synchronously directly after first message is received
    final (ReceivePort receivePort, SendPort sendPort) = await connection.future;               // await connection.future (resolves when worker send first message) and destructure the ports
    return Worker._(receivePort, sendPort);                                                     // return an instance of Worker by calling the private constructor and passing in the ports
  }

  // Private constructor to instansiate Worker class (is a not in .spawn() to allow implementation of different setup functionality later)
  Worker._(this._responses, this._commands) {                         // saves the ReceivePort and SendPort as _responses and _commands properties respectively
    _responses.listen(_handleResponsesFromIsolate);                   // add a listener to the ReceivePort and pass in a function to handle messages (after first one)
  }

  // Handles messages from worker isolate
  void _handleResponsesFromIsolate(dynamic message) {
    final (int id, Object? response) = message as (int, Object?);     // destructure response into id and decoded json
    final completer = _activeRequests.remove(id)!;                    // remove the completed request from the _activeRequests Map

    if (response is RemoteError) {                                    // resolve the request Future with the response even if it is an error
      completer.completeError(response);
    } else {
      completer.complete(response);
    }

    if (_closed && _activeRequests.isEmpty) _responses.close();       // if the Worker object has been closed and there are no more reuests the ReceivePort will be close
  }

  // Handles responses from main isolate (code runs in worker isolate)
  static void _handleCommandsToIsolate(ReceivePort receivePort, SendPort sendPort,) {     // takes in worker's ReceivePort and main isolate's SendPort
    receivePort.listen((message) {                                                        // add a listener to worker's ReceivePort
      if (message == 'shutdown') {                                                        // if the message is 'shutdown' close the ReceivePort and end this function's execution
        receivePort.close();
        return;
      }
      final (int id, String jsonText) = message as (int, String);                         // otherwise destructure the message into a id and some json
      try {
        final jsonData = jsonDecode(jsonText);                                            // try to decode the json
        sendPort.send((id, jsonData));                                                    // and send it to the main isolate
      } catch (e) {
        sendPort.send((id, RemoteError(e.toString(), '')));                               // if this causes an error (e.g. jsonText isn't json) send the error instead
      }
    });
  }

  // Function that runs when the worker isolate starts up
  static void _startRemoteIsolate(SendPort sendPort) {                // takes in main isolates SendPort
    final receivePort = ReceivePort();                                // creates the worker isolates ReceivePort
    sendPort.send(receivePort.sendPort);                              // send that port's SendPort to the main isolate
    _handleCommandsToIsolate(receivePort, sendPort);                  // calls a method to handle messages from the main isolate and passes in it's recieve port and the main isolates send port
  }

  // Closes the Worker after all active requests have been processed
  void close() {
    if (!_closed) {                                         // If the Worker object has not already been closed
      _closed = true;                                       // set _closed to true
      _commands.send('shutdown');                           // send shutdown message to worker class to close ReceivePort
      if (_activeRequests.isEmpty) _responses.close();      // if there are no more active requests vlose the main isolate's ReceivePort (add a second check at the end of _handleResponsesFromIsolate to close after requests are dealt with)
      print('--- port closed --- ');
    }
  }
}


void main() async {
  final worker = await Worker.spawn();
  print(await worker.parseJson('{"key":"value"}'));
  print(await worker.parseJson('"banana"'));
  print(await worker.parseJson('[true, false, null, 1, "string"]'));
  print(await Future.wait([worker.parseJson('"yes"'), worker.parseJson('"no"')]));
  worker.close();
}
