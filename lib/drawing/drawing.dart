import 'package:flutter/material.dart';
import 'package:flutter_mongodbtest/drawing/view/drawing_page.dart';

const Color kCanvasColor = Color(0xfff2f3f7);

class DrawingWidget extends StatelessWidget {
  const DrawingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('วาดรูป',
          style: TextStyle(fontFamily: 'ThaiLooped'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: DrawingPage(),
    );
  }
}
