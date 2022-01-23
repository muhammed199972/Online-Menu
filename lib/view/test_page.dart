import 'package:flutter/material.dart';
import 'package:onlinemenu/view_model/test_controller.dart';

class TestPage extends StatelessWidget {
  final controller = TestController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                controller.getData();
              },
              child: Text('GET Data', style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () async {
                controller.postData();
              },
              child: Text('POST Data', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
