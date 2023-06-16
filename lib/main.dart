import 'package:api_demo/Screen/Home_Screen.dart';
import 'package:api_demo/Screen/Login_Screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    ),
  );
}