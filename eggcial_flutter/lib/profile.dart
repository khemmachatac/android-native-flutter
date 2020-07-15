import 'package:eggcial_flutter/pages/ProfilePage.dart';
import 'package:flutter/material.dart';

void main () => runApp(ProfileApp());

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: ProfilePage(),
    );
  }
}
