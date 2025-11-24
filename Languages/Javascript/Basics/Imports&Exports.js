  ////////////
 // Export //
////////////

// Inline exports
export const name = "Jesse"
export const age = 40


// grouped exports
const name2 = "Jesse"
const age2 = 40
export { name2, age2 }


// default exports
const message = () => {
  const name = "Jesse";
  const age = 40;
  return name + ' is ' + age + 'years old.';
};
export default message;                                 // there can only be 1 default export per file



  ////////////
 // Import //
////////////

// Importing Exports
import { name, age } from "./Exports.js";
import { name2, age2 } from "./Exports.js";

// Impoting Default Exports
import Exports from "./Exports.js";
