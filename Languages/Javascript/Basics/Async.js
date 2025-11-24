  ///////////////
 // Callbacks //
///////////////
// A functions that is passed as an argument
function removeNeg(numbers, callback) {
  const myArray = [];
  for (const x of numbers) {if (callback(x)) {myArray.push(x);}}
  return myArray;
}
const myNumbers = [4, 1, -20, -7, 5, 9, -6];
const posNumbers = removeNeg(myNumbers, (x) => x >= 0);             // using nameless function expression as a callback



  //////////////////
 // Asynchronous //
//////////////////
// allows Javascript to run tasks in parallel
// Asynchronous code starts running when it is called but does not block the execution od subsequent code
// When the Asynchronous code has finished running 
setTimeout(func, 3000);                 // waits 3 seconds (3000ms) before executing func function
console.log("other stuff")              // this is logged before func is executed as


setInterval(func, 1000);                // executes func every second (1000ms)



  //////////////
 // Promises //
//////////////
// Promise objects represent the everntual completion or failure of an asynchorous operation and it's resulting value
// Promises have 2 properties state and result
    // state: pending                 result: undefined
    // state: fulfilled (settled)     result: a reult value
    // state: rejected (settled)      result: an error object
// Promises take a function (with 2 args) as an argument
    // 1st arg: called when the promise is fulfilled
    // 2nd arg: called when the promise is rejected

const p1 = new Promise(function(myResolve, myReject) {         // contains producing and consuming code
    let req = new XMLHttpRequest();
    req.open('GET', "mycar.htm");                                   // request a htm image
    req.onload = function() {                                       // waits for image to load
        if (req.status == 200) {myResolve(req.response);}           // if image loaded properly call the myResolve function
        else {myReject("File not Found");}                          // if image not found call the myReject function
    };
    req.send();
});

function success (value) {console.log(value)}
function failure (err) {console.log(err)}

// Calling promises
p1.then(success).catch(failure)                                 // runs then code when promise is fulfilled; runs catch code when promise is rejected
p1.then(success, failure)                                       // does the same as above
p1.then(success).then(success).catch(failure)                   // chaining promises so every then call has to wait for the one before it to call the success function

// Promise concurrency (running many promises in parrellel)
// these are static methods that return promises
Promise.all([p1, p2, p3]).then(success, failure)                // fulfills when all of the promises fulfill; rejects when any of the promises rejects
Promise.allSettled([p1, p2, p3]).then(success)                  // fulfills when all promises settle
Promise.any([p1, p2, p3]).then(success, failure)                // fulfills when any of the promises fulfills; rejects when all of the promises reject
Promise.race([p1, p2, p3]).then(success, failure)               // fulfills when any of the promises fulfills; rejects when any of the promises rejects



   ///////////
  // Await //
 ///////////
 // async/await can help you write code that's more intuitive and resembles synchronous code

 // Async function
async function myFunction() {return "Hello";}                   // async keyword means that this function returns a promise
function myFunction() {return Promise.resolve("Hello");}        // it does this by calling the static method Promise.resolve on the returned value
myFunction().then(success, failure)                             // function can be called by using .then and defining the myResolve and myReject functions

// Await keyword (can only be used in promises / async functions)
async function myDisplay() {
  let myPromise = new Promise(function(resolve) {
    setTimeout(function() {resolve("I love You !!");}, 3000);
  });

  document.getElementById("demo").innerHTML = await myPromise;    // functions waits for a resolved promise before it continues ruinning
}
