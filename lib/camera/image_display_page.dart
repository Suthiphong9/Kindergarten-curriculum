// ImageDisplayPage.dart
import 'package:flutter/material.dart';
import 'dart:io';

class ImageDisplayPage extends StatelessWidget {
  final File image;

  ImageDisplayPage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แสดงภาพ'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Center(
        child: image != null
            ? Image.file(image) // แสดงภาพที่ถูกส่งมาจากหน้าแรก
            : Text('ไม่พบภาพ'),
      ),
    );
  }
}
