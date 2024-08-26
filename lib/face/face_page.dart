import 'package:flutter/material.dart';

class FaceWidget extends StatefulWidget {
  const FaceWidget({super.key});

  @override
  State<FaceWidget> createState() => _FaceWidgetState();
}

class _FaceWidgetState extends State<FaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow from AppBar
      ),
      body: SizedBox.expand(
        child: Image.asset(
          'image/screen.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
