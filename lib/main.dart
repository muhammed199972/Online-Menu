// @dart=2.9

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinemenu/Binds.dart';

import 'Pages/Home/home_view.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binds(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TestPage(),
    );
  }
}
