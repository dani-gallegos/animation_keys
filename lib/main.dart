import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:window_size/window_size.dart';

import 'my_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (UniversalPlatform.isWindows || UniversalPlatform.isMacOS || UniversalPlatform.isLinux) {
    setWindowTitle('App title');
    setWindowMinSize(const Size(700, 500));
    setWindowMaxSize(Size.infinite);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedContainer Demo'),
        ),
        body: Center(child: MyHomePage()),
      ),
    );
  }
}
