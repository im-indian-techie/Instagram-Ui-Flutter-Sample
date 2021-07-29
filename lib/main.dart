import 'package:flutter/material.dart';
import 'package:instagram_sample/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(primaryColor: Colors.white),
       debugShowCheckedModeBanner: false,
       home:HomeScreen() ,

    );
  }
}

