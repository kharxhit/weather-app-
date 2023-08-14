import 'package:flutter/material.dart';
import 'package:proj_2/Activity/home.dart';
import 'package:proj_2/Activity/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/loading': (context) => Loading(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
