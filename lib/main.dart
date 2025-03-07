//Dariel Diaz Joseph 2022-0746

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ToolboxApp());
}

class ToolboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toolbox App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}