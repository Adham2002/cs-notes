  /////////////////
 // Concurrency //
/////////////////
/// This page will explain a conceptual overview of "concurrent" programming in Dart refers to both
/// See Asynchrony.dart or Isolates.dart for implementation details
/// 
/// Important CS definitions
/// Concurrent computing - multiple processes appear to be carried out simultaneously by switching between "threads of control" for each process
/// Parallel computing - multiple calculations or processes are carried out simultaneously at the same physical instant (usually on different processors or cores)
/// "Outise" events - events outside of the processors control (includes I/O, drawings, timers, messages from isolates, mouse events,...)
/// Asynchronous programming - deals with events occuring independently of the main program flow like "outise" events or running code concurrently
/// 
/// Dart "Concurrency"
/// Dart DOES NOT actually use concurrent computing INSTEAD it has ways of dealing with "outide" events and parallel computing (but the docs call these concurrent programming)
/// Asynchronous APIs like Future + Stream deal "outside events" (see Asynchrony.dart file)
/// Isolates implement parallel computing by allowing you to move processes to separate cores (see Isolates.dart file)



// Event Loop
// Dart’s runtime model is based on an event loop which is responsible for executing your program's code, collecting and processing events, and more
// Dart projects are of course asynchronous as they have to deal with lots of events occuring at random times
// Event queue - external events that need handling are put here
// Microtask queue - small priority tasks are put here and handled before tsks in the event queue (scheduleMicrotask() adds a function to the microtask queue)
// In the code for main and handling of an event, tasks can be added to these 2 queues but won't be dealt with until the curent event/main is done
// This is basically how the Dart runTime works:
dartRunTime(){
  Queue eventQueue = Queue();
  Queue microtaskQueue = Queue();
  bool quit = false;
  main();

  // Event Loop
  while (!quit){
    while(microtaskQueue.notEmpty){
      Function microTask = microtaskQueue.pop();
      microTask();
    }
    Function handleEvent = eventQueue.pop();
    handleEvent();
  }
}

main(){}
class Queue{
  List<Function> q = [];
  bool get notEmpty => q.isNotEmpty;
  pop(){
    Function element = q[0];
    q.removeAt(0);
    return element;
  }
}



// Futures
// A future is an object that resolves to either a value or an error after an asynchronous operation returns a response
// It allows other code to run while async operations are happening
// Futures can be used to handle async operations through .then or async await APIs (see Asynchrony.dart file for implementation details)
// We can imagine these APIs as listeners to the Fututreso that when the Future resolves it send it's result to these listeners

// asyncMethod().then(Function func)
  // 1. AsyncMethod initiates the async operation but before it get a response it returns a future (non blocking)
  // 2. .then method is called on this future and takes in the func callback to be run when the a responce is recieved
  // 3. Rest of the function completes as normal and event loop moves onto next event in queue
  // 5. Once the aync operation is complete func will be added to the micro tasks queue

// asyncAwaitMethod() async {return await asyncMethod();}
  // 1. When asyncAwaitMethod is called the synchronous code before the await is run
  // 2. When await is encoutered it returns the value of asyncMethod() which will be a future
  // 3. Rest of the function that called asyncAwaitMethod completes as normal and event loop moves onto next event in queue
  // 4. Once the the aync operation is complete the rest of the code in asyncAwaitMethod is added to the micro tasks queue



// Streams
// A stream provide values in the repeatedly and asynchronously over time
// Like a Future it allows other code to while waiting for a value but it does this multiple times
// Single subscription streams - events need to be delivered in the correct order and without any being missed like reading a file or a web request (can only be listened to once and have 1 listener)
// Broadcast streams - emits individual that can be handled one at a time. It can have multiple listeners that start and stop listening at any time
// Streams can be handle through .listen or async await for APIs (see Asynchrony.dart file for implementation details)

// stream.listen(Function func)
  // 1. The .listen method is called on this stream and takes in the func callback to be run when the stream emits a value
  // 2. Rest of the synchronous code completes as normal and event loop moves onto next event in queue
  // 3. Once the stream emits a value func will be added to the micro tasks queue

// asyncAwaitMethod() async { await for (final value in stream){};}
  // 1. When asyncAwaitMethod is called the synchronous code before the await is run
  // 2. When await for is reached control is handed back to where asyncAwaitMethod was called from
  // 3. Rest of the synchronous code (not in asyncAwaitMethod) completes as normal and event loop moves onto next event in queue
  // 4. When the stream emits a value the code in the await for loop runs
  // 5. Once the stream ends the rest of the code in asyncAwaitMethod is added to the micro tasks queue



// Isolates
// Dart programs run in the main isolate by default and contains the thread where a program starts to run and execute
// Isolates run on different cores (so no shared memory unlike multi-threading)
//If 2 isolate are in the same isolate group they can both access the apps codebase and any immutable data (like Strings, Number and const variables)
// We can spawn new isolates if there are operations that are too expensive and are making the UI unresponsive
// The isolates will have to message each other as they have no shared memory. We can Use Isolates using Isolate.run() or Isolate.spawn() which are both async operations that return futures
// Isolate.run() - takes in a function, runs it on an isolate and returns the result (.run() abstracts away setting up and managing worker isolates)
// Isolate.spawn() - Create an long lived isolate that can handle multiple messages over time using SendPort and RecievePort
  // RecievePort object - used to recieve messages from other isolates  and creates it's own SendPort when it's created (a reference to this SendPort can sent to multiple Isolates)
    // It implements Stream 
  // SendPort object - a property of a RecievePornt used to send messages to that specific RecievePornt it was created from
  // RawReceivePort - a lower-level ReceivePort that requires a handler property to be set instead of allowing any listeners
    // ReceivePort has a static fromRawReceivePort() method that converts a RawReceivePort into a ReceivePort
    // This is useful as it gets rid of the handler and allows linsteners to subscribe to it while retaining the same SendPort
    // It is best practice to use it to handle startup logic and then convert it to a ReceivePort to handle messages after that

// Isolate.run(func)
  // 1. Spawns (starts and creates) an isolate
  // 2. Runs func on the spawned isolate
  // 3. Captures the result
  // 4. Returns the result to the main isolate
  // 5. Terminates the isolate once work is complete
  // 6. Checks, captures, and throws exceptions and errors back to the main isolate

// Using Isolate.spawn(entryPoint, message) for long lived functions with robust ports
  // 1. Create a ReceivePort in the main isolate (automatically creates a SendPort property, ReceivePort.sendPort)
  // 2. Spawn the worker isolate with Isolate.spawn(Function(T) entryPoint, T message)
    // message - the first message send to the new worker isolate and as such will be passed to the entryPoint function (for long lived isolates this has to be ReceivePort.sendPort)
    // entryPoint - reference to the function that The isolate will run. It must:
      // 1. Create a new ReceivePort in the worker isolate
      // 2. Pass the worker isolate's ReceivePort.sendPort as the first message back to the main isolate
      // 3. Use the ReceivePort.listen(callback) function to listen for new messages until ReceivePort closes
      // 4. When a message is recieved the callback(message) function is called
      // 5. If the message is tells the isolate to shutdown then close the ReceivePort
  // 3. When the first message which will be the worker isolates SendPort use it to send messages to the Isolate
  // 4. When you want to close the Isolate send the predetermined shutdown message and then close the ReceivePort