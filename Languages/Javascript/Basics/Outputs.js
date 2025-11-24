/* Outputs */

// get HTML element by IS
let v = document.getElementById("element");

// changing HTLM elements
document.getElementById("element").innerHTML = 5 + 6;
document.getElementById('myImage').src='pic_bulbon.gif';

// writing to a webpage for testing (will delete all existing HTML if executed after HMTL has loaded)
document.write(5 + 6);

// writing into an alert box
window.alert(5 + 6);
alert(5 + 6);       // window keyword not needed (window is always in global scope)

// writing to browser log for debugging (find log by inspecting page)
console.log(5 + 6);

// print contents of current page (out of a physical paper printer)
window.print()