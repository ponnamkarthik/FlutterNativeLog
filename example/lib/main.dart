import 'package:flutter/material.dart';
import 'package:flutter_native_log/flutter_native_log.dart';
import 'package:flutter_native_log_example/sec.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //get instance of FlutterNativeLog
  FlutterNativeLog flutterNativeLog = new FlutterNativeLog();

  @override
  initState() {
    super.initState();
    //set you are in production or in debug once
    flutterNativeLog.setIsProduction(isProduction: false);

    printLogs();
  }

  void printLogs() {

    //Start logging
    flutterNativeLog.w(tag: "Karthik", msg: "This is Test Warning"); // logType = warning
    flutterNativeLog.e(tag: "Karthik", msg: "This is Test Error"); // logType = error
    flutterNativeLog.d(tag: "Karthik", msg: "This is Test Debug"); // logType = debug
    flutterNativeLog.i(tag: "Karthik", msg: "This is Test Info"); // logType = debug
    flutterNativeLog.v(tag: "Karthik", msg: "This is Test Verbose"); // logType = debug
    flutterNativeLog.wtf(tag: "Karthik", msg: "This is Test WTF"); // logType = debug

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Text('Running'),
              ),
              new Padding(
                child: new SecondClass(),
                  padding: EdgeInsets.all(20.0)
              )
            ],
          ),
        ),
      ),
    );
  }
}



