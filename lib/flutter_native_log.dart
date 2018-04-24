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

  Future<String> d({@required String tag, @required String msg, bool forceLog = false}) async {

    final Map<String, dynamic> params = <String, dynamic> {
      'tag': tag,
      'msg': msg,
      'logType': 'debug'
    };

    if(!isProd) {
      log(params);
    } else if(isProd && forceLog) {
      log(params);
    }
    return "Done";
  }
  Future<String> e({@required String tag, @required String msg, bool forceLog = false}) async {

    final Map<String, dynamic> params = <String, dynamic> {
      'tag': tag,
      'msg': msg,
      'logType': 'error'
    };

    if(!isProd) {
      log(params);
    } else if(isProd && forceLog) {
      log(params);
    }
    return "Done";
  }
  Future<String> v({@required String tag, @required String msg, bool forceLog = false}) async {

    final Map<String, dynamic> params = <String, dynamic> {
      'tag': tag,
      'msg': msg,
      'logType': 'verbose'
    };

    if(!isProd) {
      log(params);
    } else if(isProd && forceLog) {
      log(params);
    }
    return "Done";
  }
  Future<String> w({@required String tag, @required String msg, bool forceLog = false}) async {

    final Map<String, dynamic> params = <String, dynamic> {
      'tag': tag,
      'msg': msg,
      'logType': 'warning'
    };

    if(!isProd) {
      log(params);
    } else if(isProd && forceLog) {
      log(params);
    }
    return "Done";
  }
  Future<String> i({@required String tag, @required String msg, bool forceLog = false}) async {

    final Map<String, dynamic> params = <String, dynamic> {
      'tag': tag,
      'msg': msg,
      'logType': 'info'
    };

    if(!isProd) {
      log(params);
    } else if(isProd && forceLog) {
      log(params);
    }
    return "Done";
  }
  Future<String> wtf({@required String tag, @required String msg, bool forceLog = false}) async {

    final Map<String, dynamic> params = <String, dynamic> {
      'tag': tag,
      'msg': msg,
      'logType': 'wtf'
    };

    log(params);
    return "Done";
  }


  void log(params) async {
      await _channel.invokeMethod('printLog', params);
  }

}
