  /////////////////
 // Generators ///
/////////////////


// Synchronous generators
// Synchronous generators are functions that return Iterable objects that lazily produce a sequence of values
// Methods that return iterables like .map() and .where() ARE synchronous generators
// Lists, Sets and Map.keys are all iterables but ARE NOT lazily generated
Iterable<int> naturalsTo(int n) sync* {                       // sync* keyword denotes the function as a synchronous generator that must return an Iterable object
  int k = 0;
  while (k < n) yield k++;                                    // generators must use the yield keyword instead of return
}

Iterable<int> naturalsDownFrom(int n) sync* {                 //  recursive generator performance can be improved by using yield*
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);                           // delegates the call to another generator and resumes generating its own values when the other generator is done
  }
}

// Using synchronous generators
void usingSynchronousGenerators(){
  naturalsTo(4).forEach(print);                 // iterables can be used in for loops like this. Behind the scenes this is whatis happening:
  Iterator i = naturalsTo(4).iterator;          // Iterator object is creted using a field of the Iterable object
  print(i.moveNext());                          // moveNext generates the next (first in this case) value in the sequence and returns true
  print(i.current);                             // currrent field accessing the current value in the sequence
  print(i.moveNext());                          // MoveNext() works by simply running the generator code and stopping when a yield is ecountered returning yielded value
  print(i.current);
  print(i.moveNext());                          
  print(i.current);
  print(i.moveNext());
  print(i.current);
  print(i.moveNext());                          // if MoveNext() hits the end of the generator code it will return false as there are no more values to be yielded/ calues in the sequence
  print(i.current);                             // trying to access current will give a script error

  Iterator i2 = naturalsTo(4).iterator;
  while(i2.moveNext()) {                         // does same as above
    print(i2.current);
  }
}


// Asynchronous generators 
// Asynchronous generators are functions that return Stream objects that will emit valaues/events to a consuming statement until the Stream ends (see Concurrency.dart for more details)
Stream<int> asynchronousNaturalsTo(int n) async* {                  // async* keyword denotes the function as an asynchronous generator that must return a Stream object
  int k = 0;                                                        //
  await Future.delayed(Duration(seconds: 1));                       // as this is an async function we can use the await
  while (k < n) yield k++;                                          // which always yield futures
}

void usingASynchronousGenerators() async {
  try{                                                              // wrap in a try loop to catch any exceptions thrown
    await for (var number in asynchronousNaturalsTo(4)) {           // await for consumes/is a listener/subscribes to the stream until it ends
      print(number);                                                // When the stream emits a value the contents of the for loop is added to the micro tasks queue (see Concurrency.dart)
    }
  } catch(e){}
  
  asynchronousNaturalsTo(4).listen(
    (number) => print(number),                                      // . listen does the same thing but with callbacks (returns a StreamSubscription that calls the callback)
    onDone: (){},                                                   // runs when callback is done
    onError: (e){}                                                  // catch exceptions like this
  );
}
