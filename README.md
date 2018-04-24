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
  flutter_native_log: "^0.3.0"
  
```

```dart
// import
import 'package:flutter_native_log/flutter_native_log.dart';

// initialize
FlutterNativeLog flutterNativeLog = new FlutterNativeLog();

// set production or debug default to debug
flutterNativeLog.setIsProduction(isProduction: true);


//Start logging
flutterNativeLog.w(tag: "Karthik", msg: "This is Test Warning"); // logType = warning
    flutterNativeLog.e(tag: "Karthik", msg: "This is Test Error"); // logType = error
    flutterNativeLog.d(tag: "Karthik", msg: "This is Test Debug"); // logType = debug
    flutterNativeLog.i(tag: "Karthik", msg: "This is Test Info"); // logType = debug
    flutterNativeLog.v(tag: "Karthik", msg: "This is Test Verbose"); // logType = debug
    flutterNativeLog.wtf(tag: "Karthik", msg: "This is Test WTF"); // logType = debug
//if you want to log in production

flutterNativeLog.d(tag: "Karthik", msg: "This is Test Log from Production", forceLog: true);

```

