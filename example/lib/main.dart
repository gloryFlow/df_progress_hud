import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:df_progress_hud/df_progress_hud.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  // 配置样式
  DfProgressHud().showHudSettings(
    dismissTimeInterval: 2,
    foregroundColor: "ffffff",
    backgroundColor: "444444",
    cornerRadius: 4,
    borderWidth: 0,
    borderColor: "f7f7f7",
    fontSize: 14,
  );

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
  }

  void showProgressStatus() {
    _dfProgressHudPlugin.showStatus(message: "加载中...");
    Future.delayed(Duration(seconds: 5), () {
      _dfProgressHudPlugin.dismiss();
    });
  }

  void showSuccess() {
    _dfProgressHudPlugin.showSuccess(message: "加载成功");
    // Future.delayed(Duration(seconds: 5), () {
    //   _dfProgressHudPlugin.dismiss();
    // });
  }

  void showError() {
    _dfProgressHudPlugin.showError(message: "加载失败");
    // Future.delayed(Duration(seconds: 5), () {
    //   _dfProgressHudPlugin.dismiss();
    // });
  }

  void showToast() {
    _dfProgressHudPlugin.showToast(message: "已加载，请点击详情查看内容哦～");
    // Future.delayed(Duration(seconds: 5), () {
    //   _dfProgressHudPlugin.dismiss();
    // });
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
              Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              Container(
                width: 100,
                color: Colors.blue,
                height: 30,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    showProgressStatus();
                  },
                  child: Text('显示进度'),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              Container(
                width: 100,
                color: Colors.blue,
                height: 30,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    showSuccess();
                  },
                  child: Text('提示成功'),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              Container(
                width: 100,
                color: Colors.blue,
                height: 30,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    showError();
                  },
                  child: Text('提示失败'),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              Container(
                width: 100,
                color: Colors.blue,
                height: 30,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    showToast();
                  },
                  child: Text('提示toast'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
