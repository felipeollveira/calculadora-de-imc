import 'package:flutter/material.dart';
import 'package:helloworld/pages/home_page.dart';

void main() {
  runApp(const IMC());
}

class IMC extends StatelessWidget {
  const IMC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
     primarySwatch: Colors.indigo),
    home: HomePage(),
    );
  }
}

