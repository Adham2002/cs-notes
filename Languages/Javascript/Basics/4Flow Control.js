  /////////////
 // if else //
/////////////
// Ternary operator - see 2operators.js file

if (time < 10) {
    greeting = "Good morning";
} else if (time < 20) {
    greeting = "Good day";
} else {
    greeting = "Good evening";
}


// Switch cases use strict comparison (===) so cases have to be of the same type and value
switch (new Date().getDay()) {                          // getDay() returns the current day if the week as a number
    case 4:
    case 5:
      text = "Soon it is Weekend";                      // case 4 and 5 run the same code
      break;                                            // break added so rest of the cases don't have to be checked
    case 0:
    case 6:
      text = "It is Weekend";
      break;
    default:
      text = "Looking forward to the Weekend";          // default run if no matching cases are found
}


  ///////////
 // Loops //
///////////

// For loop
for (let i = 0, len = cars.length, text = "";           // can technically use 1st expression for anything or nothing (usually used for initialising counter)
    i < len;                                            // if 2nd expression returns true loop continues otherwise it end (also technically optional)
    i++) {                                              // can technically use 1st expression for anything or nothing (usually used for incrementing counter)
    text += cars[i] + "<br>";
  }

// For in loop
for (let x in person) {console.log(x);}                 // loops over onjects and array but not necessarily in order

// for each loop
array.forEach(function(value){console.log(value)});     // value keyword is necessary

// For of loop
// loops through the values of an iterable object
for (variable of iterable) {
    // code block to be executed
}


// While loop
while (condition) {
    // code block to be executed
}

// Do loop
  do {
    // code block to be executed
}
while (condition);


// Continue and break
for (let i = 0; true; i++) {
    if (i == 3) { continue; }                  // skips the iteration where i == 3
    if (i == 10) { break; }                    // stops loop when i == 10
    text += "The number is " + i + "<br>";
  }
  