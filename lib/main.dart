import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dance/dance.dart';
import 'control_led.dart';
import 'drawing/drawing.dart';
import 'face/face_page.dart';
import 'camera/image_display_page.dart';
import 'zoo/zoo_page.dart';
import 'thai/thai_page.dart';
import 'eng/eng_page.dart';
import 'number/number_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // เรียกใช้ MyHomePage เป็นหน้าแรกของแอป
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _getImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageDisplayPage(image: imageFile),
        ),
      );
    }
  }

  ElevatedButton buildElevatedButton(BuildContext context, String text,
      Widget widget, Color color, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // ปรับความโค้งของปุ่ม
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
      },
      icon: Icon(icon, size: 30), // เพิ่มไอคอน
      label: Text(
        text,
        style: const TextStyle(
          fontFamily: 'ThaiLooped',
          fontSize: 30, // ปรับขนาดตัวอักษรให้พอดี
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'KinderBot',
            style: TextStyle(
                fontFamily: 'RobotoMonoFont',
                fontSize: 40,
                color: Colors.white),
          ),
        ),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: GridView.count(
            crossAxisCount: 3, // ปรับจำนวนคอลัมน์ให้เหลือ 2
            mainAxisSpacing: 30.0, // ระยะห่างระหว่างปุ่มในแนวแกนหลัก
            crossAxisSpacing: 20.0, // ระยะห่างระหว่างปุ่มในแนวแกนแนวนอน
            padding: EdgeInsets.all(10.0),
            childAspectRatio: 1.5, // ปรับอัตราส่วนของปุ่ม
            children: [
              buildElevatedButton(context, 'ก-ฮ', const ThaiWidget(),
                  const Color(0xFF483D8B), Icons.book),
              buildElevatedButton(context, 'ABC', const EngConsonantsWidget(),
                  const Color(0xFF4169E1), Icons.language),
              buildElevatedButton(context, '123', const NumWidget(),
                  const Color(0xFF5F9EA0), Icons.numbers),
              buildElevatedButton(context, 'เต้น', const DanceWidget(),
                  const Color(0xFFCD5C5C), Icons.music_note),
              buildElevatedButton(context, 'สัตว์', const ZooPageWidget(),
                  const Color(0xFFDB7093), Icons.pets),
              buildElevatedButton(context, 'วาดภาพ', const DrawingWidget(),
                  const Color(0xFFB03060), Icons.brush),
              buildElevatedButton(context, 'สนทนา', const ButtomLedWidget(),
                  const Color(0xFF228B22), Icons.chat),
              buildElevatedButton(context, 'พัก', const FaceWidget(),
                  Color.fromARGB(255, 120, 108, 199), Icons.book),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _getImage(context),
        child: const Icon(Icons.camera_alt),
        backgroundColor: const Color.fromARGB(255, 234, 235, 236),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
