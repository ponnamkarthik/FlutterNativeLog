# [flutter_native_log](https://pub.dartlang.org/packages/flutter_native_log)

Flutter Plugin to print Log messages 

You can set either in production or in debug once
```java
if production
    NO Logs in production
  
 if debug 
     debug
     warning
     info
     error
     verbose
     wtf  
```

## Usage

import dependency


```yaml

dependencies:
  flutter_native_log: "^0.2.0"
  
```

```dart
// import
import 'package:flutter_native_log/flutter_native_log.dart';

// initialize
FlutterNativeLog flutterNativeLog = new FlutterNativeLog();

// set production or debug default to debug
flutterNativeLog.setIsProduction(isProduction: true);


//Start logging
flutterNativeLog.printLog(tag: "Karthik", msg: "This is Test Default Log"); // default logType
flutterNativeLog.printLog(tag: "Karthik", msg: "This is Test Warning", logType: Log.WARNING); // logType = warning
flutterNativeLog.printLog(tag: "Karthik", msg: "This is Test Error", logType: Log.ERROR); // logType = error
flutterNativeLog.printLog(tag: "Karthik", msg: "This is Test Debug", logType: Log.DEBUG); // logType = debug
flutterNativeLog.printLog(tag: "Karthik", msg: "This is Test Info", logType: Log.INFO); // logType = debug
flutterNativeLog.printLog(tag: "Karthik", msg: "This is Test Verbose", logType: Log.VERBOSE); // logType = debug
flutterNativeLog.printLog(tag: "Karthik", msg: "This is Test WTF", logType: Log.WTF); // logType = debug

//if you want to log in production

flutterNativeLog.printLog(tag: "Karthik", msg: "This is Test Default Log", forceLog: true);

```

