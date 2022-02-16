import 'package:flutter/material.dart';
import 'package:flutter_ui_bank_app/pages/my_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCards(),
      color: Colors.red,
    );
  }
}
