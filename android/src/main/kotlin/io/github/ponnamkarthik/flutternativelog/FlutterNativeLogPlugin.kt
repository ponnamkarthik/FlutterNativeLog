package io.github.ponnamkarthik.flutternativelog

import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.PluginRegistry.Registrar

import android.util.Log

class FlutterNativeLogPlugin(): MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar): Unit {
      val channel = MethodChannel(registrar.messenger(), "PonnamKarthik/flutter_native_log")
      channel.setMethodCallHandler(FlutterNativeLogPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result): Unit {

    if(call.method.equals("printLog")){

      val msg: String = call.argument("msg")
      val tag: String = call.argument("tag")
      val logType: String = call.argument("logType")

      if(logType.equals("warning")) {
        Log.w(tag, msg)
      } else if(logType.equals("error")) {
        Log.e(tag, msg)
      } else if(logType.equals("verbose")) {
        Log.v(tag, msg)
      } else if(logType.equals("wtf")) {
        Log.wtf(tag, msg)
      } else if(logType.equals("info")) {
        Log.i(tag, msg)
      } else {
        Log.d(tag, msg)
      }

      result.success("Logged Successfullt!")

    } else {
      result.notImplemented()
    }
  }
}
