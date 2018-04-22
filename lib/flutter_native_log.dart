import 'dart:async';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

enum Log {
  DEBUG,
  WARNING,
  ERROR,
  VERBOSE,
  WTF,
  INFO
}

class FlutterNativeLog {

  static bool isProd = false;

  static final FlutterNativeLog _singleton = new FlutterNativeLog._internal();

  factory FlutterNativeLog() {
    return _singleton;
  }

  void setIsProduction({@required bool isProduction}) {
    isProd = isProduction;
  }

  FlutterNativeLog._internal();


  static const MethodChannel _channel =
      const MethodChannel('PonnamKarthik/flutter_native_log');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<String> printLog({Log logType,@required String tag, @required String msg}) async {


    bool canLog = true;
    String log = "debug";
    if(logType == Log.WARNING) {
      log = "warning";
    } else if(logType == Log.ERROR) {
      log = "error";
    } else if(logType == Log.VERBOSE) {
      log = "verbose";
    } else if(logType == Log.WTF) {
      log = "wtf";
    } else if(logType == Log.INFO) {
      log = "info";
    } else if(logType == Log.DEBUG && !isProd){
      log = "debug";
    }

    if((isProd && logType == Log.DEBUG) || (isProd && logType == null)) {
      canLog = false;
    }

    if(canLog) {
      final Map<String, dynamic> params = <String, dynamic> {
        'tag': tag,
        'msg': msg,
        'logType': log
      };
      final String result = await _channel.invokeMethod('printLog', params);
      return result;
    } else {
      return "Done";
    }
  }
}
