  ////////////////////
 // Error Handling //
////////////////////
/// Exceptions - errors indicating that something unexpected happened
/// Dart can throw/raise and catch exceptions
/// If a thrown/raised exception isn't caught, the isolate that raised the exception is suspended, and typically the isolate and its program are terminated
/// Dart provides Exception and Error objects with many predefined subtypes to be thrown
/// But any non-null object can be thrown as an expection


// Throwing Exceptions
void throwingExceptions(bool v){
  if (v){throw FormatException('Expected at least 1 section');}           // throwing a FormatException object
  if (v){throw 'Out of llamas!';}                                         // throwing a string
  void distanceTo(String other) => throw UnimplementedError();            // throwing is an expression so can be used anyware dart allows expressions
}


// Catching Exceptions
void cathcingExceptions(var v){
  try {                                                                 // we can use "on" to specify the object type you want to capture and "catch" to catch the object + stack and use them
    throwingExceptions(true);                                           // catching/capturing an exception stops the exception from propagating and lets you handle it
  } on FormatException {print("don't do that");                         // catches FormatException exceptions
  } on Exception catch (e) {print('Unknown exception: $e');             // catches any other exceptions and also locally saves the exceptions as a variable e
  } catch (e, s) {
    print('Exception: $e, Stack: $s');                                  // catches any object thrown and the StackTrace object
    rethrow;                                                            // partially handles the exception while allowing it to propagate
  } 
  finally {                                                             // finally clause runs no matter what after any matching catch clauses 
    print('exceptions handled');                                        // 
  }
}

// Assert
// Assert statement disrupt the normal execution if a boolean condition is false and displays an optional message
// This is very useful for debugging
// Flutter only enables assertions in debug mode otherwise they won't even be evaluated
void Assert(bool v){
  String? text;
  assert(text != null, "oh no text is null");               // stops execution of program and displayed message as text is null 
}
