import 'package:flutter/material.dart';

class SplatScreen extends StatefulWidget {
  static const String router = "/SplatScreen";
  @override
  _SplatScreenState createState() => _SplatScreenState();
}

class _SplatScreenState extends State<SplatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        "assets/images/logo.png",
        height: 250,
      )),
    );
  }
}
