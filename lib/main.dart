import 'package:flutter/material.dart';
import 'package:reyting/qwe1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

void main() {
  runApp(const Reyting());
}

class Reyting extends StatelessWidget {
  const Reyting({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: qwe1()

    );
  }
}
