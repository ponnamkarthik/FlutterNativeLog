import 'package:flutter/material.dart';
import 'package:flutter_native_log/flutter_native_log.dart';

class SecondClass extends StatefulWidget {
  @override
  _SecondClassState createState() => new _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {

  @override
  void initState() {
    super.initState();
    FlutterNativeLog flutterNativeLog = new FlutterNativeLog();
    flutterNativeLog.d(tag: "Karthik", msg: "From Second One");
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Text(
          "This is Second one"
      ),
    );
  }
}