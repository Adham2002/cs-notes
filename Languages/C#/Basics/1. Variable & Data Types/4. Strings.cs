/////////////
// Strings //
////////////
/// Strings are immutable objects storing a sequence of chars
/// So any string manipulation methods return new strings
string s = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
string s2 = "abc";


// String properties
s.Length;       // length of string
s[2];           // char at specified index


// String manipulation
s3 = s + s2;            // string concatenation
s.IndexOf("E");         // returns first instance of char or -1 if not ound
s.Substring(0, 5);      // returns substring between range (x,y]

// String formatting
string s3 = $"My full name is: {s} {s2}";         // string interpolation
// use \ to write escape characters
// @ prefix creates a verbatim string that ignores any escape chars


// Checks



// Searching



// Other

