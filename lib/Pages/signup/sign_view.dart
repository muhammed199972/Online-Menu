import 'package:flutter/material.dart';

import 'sign_view_model.dart';

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
                controller.modelvariable();
              },
              child: Text('GET Data', style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () async {
                // controller.postData();
              },
              child: Text('POST Data', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
