  ////////////
 // Import //
////////////

// Importing core libraries
import 'dart:math';

// Importing libraries from external packages managed by a packet manager
/*
import 'package:lib1/lib1.dart';
import 'package:lib1/lib1.dart' show foo;             // only imports foo from lib1
import 'package:lib1/lib1.dart' hide foo;             // imports everything except foo
import 'package:lib2/lib2.dart' as lib2;              // objects in lib2 will need to be refered to using the lib2. prefix (useful in case libraries have clashing identifier names)
*/

// Importing Files
import '../3. OOP & Functions/3. Mixins.dart';

// Lazy Loading
import '../3. OOP & Functions/3. Mixins.dart' deferred as hello;    // defers loading to load another specified time (useful to reduce initial startup time and load rarely used functionalitites)
Future<void> new1() async{
  await hello.loadLibrary();
}

void main(){}
