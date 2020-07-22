import 'package:eggcial_flutter/pages/MessagePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MessageApp());

class MessageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MessagePage(),
    );
  }
}
