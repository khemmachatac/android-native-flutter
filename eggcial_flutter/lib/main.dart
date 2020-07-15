import 'package:eggcial_flutter/profile.dart' as p;
import 'package:eggcial_flutter/message.dart' as m;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
void message() => m.main();
void profile() => p.main();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        body: Text("FLUTTER APP"),
      ),
    );
  }
}
