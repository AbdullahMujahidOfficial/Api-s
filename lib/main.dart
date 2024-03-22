import 'package:api_practice/api_serivces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Models.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
       MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: apiServices(),
    );
  }
}




