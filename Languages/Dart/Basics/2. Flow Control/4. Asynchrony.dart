  ////////////////
 // Asynchrony //
////////////////
/// Dart's supports for asynchronous programming deals with "outise" events not concurrent programming (see Concurrency for more details)
/// Dart provides the asynchronous APIs:
    /// Future which represent the result of an asynchronous operation. The Future will resolve to that value the async operation returns
    /// Stream which represents a promise to provide a series of values over time
import "dart:async";

// Then
// Future.then() is a method in the Future class that takes in callback to be run when the async operation resolves
void futureThen(){
  Future.delayed(Duration(seconds: 2))                      // .then must be called on a Future (usually an async function that will resolve the Future later)
  .then((response) {print('Success!');})                    // .then code runs once async operation completes and Future resolves
  .then((response) {print('Success!');})                    // chain mutiple .thens like this
  .catchError((e){});                                       // catch error like this
}


// Async and await
// this is prefered over using .then as it flows more like synchronous code and avoids "callback hell"
// It pauses the execution of an async function when it encounters an await and start running it again when the async operation is completed
Future<String> fetchFromServer() async {
  await Future.delayed(Duration(seconds: 2));                   // await pauses the functions execution and returns a Future
  return 'Server data';                                         // the rest will run once this future resolves
}

Future futureAsyncAwait() async {
  try{                                                          // wrap in a try loop to catch any exceptions thrown
    var data = await fetchFromServer();
    await Future.delayed(Duration(seconds: 2));                 // chaining here works by puting 2 awaits one after the other
  } catch (e) {}

  await Future.wait([                                          // .wait() static method starts several async operations at the same time (use when 1 doesn't depend on any of the others)
    fetchFromServer(),                                         // .wait() takes in any iterable containing Futures
    fetchFromServer(),                                         // .wait() resolves to a list of the resolved futures once they have all resolved
  ]); 

  try{
    (String, String) result = await (fetchFromServer(), fetchFromServer()).wait;          // the .wait getter does the same thing except it allows you to catch errors
  } on ParallelWaitError<(String?, String?), (AsyncError?, AsyncError?)> catch(e){        // catch errors like this (record allows for different Future types in the iterable)
//} on ParallelWaitError<List<bool?>, List<AsyncError?>> catch (e) {                      // if result was a list we change the generics like this
    print(e.values.$1);               // Prints successful future
    print(e.values.$2);               // Prints null if the result is an error

    print(e.errors.$1);               // Prints null if result is successful
    print(e.errors.$2);               // Prints error if result is unsuccessful
  }

}


// Completer
// This class provides a way to manually create and complete a future, either successfully or with an error
Future<String> completer() async{
  final completer = Completer<String>();                             // instansiate a Completer
  await Future.delayed(Duration(seconds: 2));                        // simulates an async operation
  completer.complete('Data fetched');                                // once the async operation is done manually resolves the Future to a success like this (anything awaiting the Completer.future gets added to microtasks queue)
  //completer.completeError('Error fetching data');                  // We can also resolve to an error like this (WARNING: this would raise an error as we can only resolve the Future once)
  return completer.future;                                           // while the async operation happens we can use the completer's future like this
}
// Completer.sync() is used to optimise event propagation when one asynchronous event immediately triggers another by running code immedietly instead of adding it to the microqueue tasks
Future completerSync() {
  final completer = Completer.sync();                                               // Create a synchronous Completer
  completer.future
  .then((value) {print('Future completed with value: $value');});                   // .then() runs synchronousdirectly after completer.complete() runs (instead of being added to microtasks queue)
  completer.complete('Hello, sync!');                                               // immediately runs listener functions awaiting Completer.future (instead of adding to microtasks queue)
  return completer.future;                                                          // WARNING: only use when calls to complete/completeError is guaranteed to not break Future invariants.
}

main() async {print(await completerSync());}


// Streams
// Streams provide values in the future and repeatedly over time
// See Generators.dart for implementation details andConcurrency.dart for a high level overview of the processes behind streams



