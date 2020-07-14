import 'package:eggcial_flutter/pages/MessagePage.dart';
import 'package:eggcial_flutter/pages/ProfilePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

void message () => runApp(MessageApp());
void profile () => runApp(ProfileApp());

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

class MessageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: MessagePage(),
    );
  }
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: ProfilePage(),
    );
  }
}
