import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:df_progress_hud/df_progress_hud.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _dfProgressHudPlugin = DfProgressHud();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _dfProgressHudPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  void showProgressStatus() {
    _dfProgressHudPlugin.showToastStatus(message: "加载中...");
    Future.delayed(Duration(seconds: 5), () {
      _dfProgressHudPlugin.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: Text('Running on: $_platformVersion\n'),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
              Container(
                width: 100,
                color: Colors.red,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    showProgressStatus();
                  },
                  child: Text('显示进度'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
