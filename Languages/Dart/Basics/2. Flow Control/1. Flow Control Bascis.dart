  //////////////////
 // Flow Control //
//////////////////

// Variables
var nums = [1,2];
var year = 2000;


// Loops
void loops(){
  for (int month = 1; month <= 12; month++) {print(month);}               // for loop 
  for (final num in nums) {print(num);}                                   // for-in loop
  nums.forEach((element) {print(element);});                              // for-each loop can be used on iterables
  while (year < 2016) {year += 1;}                                        // while loop
  do {year += 1;} while (year < 2016);                                    // do-while loop evaluates condition after loop

  // break and continue
  while (true) {
    year += 1;
    if (year < 2016) break;                                               // break stops the loop running (this loop does the same as above loop)
  }

  for (int month = 1; month <= 12; month++) {
    if (month == 5) continue;                                             // continue skips to the next loop iteration (month 5 won't be printed)
    print(month);
  }
}


// Branching
void branching(){
  if (year >= 2001) {                                                     // if statement
    print('21st century');
  } 
  else if (year >= 1901) {                                                // else if statement
    print('20th century');
  }
  else{                                                                   // else statement
    print('before 20th century');
  }

  if (nums case [int x, int y]) print('$x, $y');                          // if-case allows for pattern matching


  // Switch statements
  var command = 1;
  switch (command) {                  // switch statement evaluates a value expression against a series of cases that are patterns
    case 1:                           // each case is checked in order and when one matches  the case body runs and then jump to the end of the switch
      continue newCase;               // continue skips to the specified case
    case 2:                           // empty cases "fall through" when matched meaning it will just run the next cases body
    case 3:
      print('2 or 3');
    newCase:                          // this is a names case that is jumped to
    case 4:
      print('1 or 4');
    default:                          // same as using a wildcard _
      print('');                      
  }


  // Switch expressions
  var token = switch (command) {                // switch expressions provides a shorter syntax for produces a value based
    1 || 2 || 3 || 4 => '1-4',                  // this can be used wherever an expression can be used e.g. variable initialisation, return statements ...
    5 || 6 => '5 or 6',                         // funtion expression syntax (=>) is used to return values so the body must be a single expression
    >= 7 && <= 10 => '7-10',                    // each case must have a body (no fallthroughs)
    _ => throw FormatException('Invalid')       // must use wildcard not default
  };


  // Guard clauses
  // guard clauses can follow a case clause in an if-case statemt, switch statement or switch expression
  // They allow you to add further constraints (outside of pattern matching) to a case
  if (nums case [int x, int y] when year == 2016){}         // here we add an extra case that has nothing to do with the comparison of the value nums
}


// Sealed types
// Enums and sealed types are useful for switches as all possible values are known and enumerable
// See "Class Modifiers.dart" file for more details
