import 'package:flutter/material.dart';
import 'package:untitled1/screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      routes: {
        "/" : (context)=> const HomePage(),
      },
    ),
  );
}


