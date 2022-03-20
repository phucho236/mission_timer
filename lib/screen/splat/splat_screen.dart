import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/screen/splat/splat_controller.dart';

class SplatScreen extends StatefulWidget {
  static const String router =  "/SplatScreen";
  @override
  _SplatScreenState createState() => _SplatScreenState();
}

class _SplatScreenState extends State<SplatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<SplatController>().init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
          child: Image.asset("assets/images/logo.png",height: 250,)
        ),
    );
  }
}