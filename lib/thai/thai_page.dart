import 'package:flutter/material.dart';
import 'thai_consonant.dart';
import 'game/thai_game.dart';

class ThaiWidget extends StatefulWidget {
  const ThaiWidget({Key? key}) : super(key: key);

  @override
  State<ThaiWidget> createState() => ThaiWidgetState();
}

class ThaiWidgetState extends State<ThaiWidget> {
  
  ElevatedButton buildElevatedButton(
      BuildContext context, String text, Widget widget, Color color) {
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
      // เพิ่มไอคอน
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
        title: const Text(
          'ภาษาไทย',
          style: TextStyle(fontFamily: 'ThaiLooped'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 30.0, // ระยะห่างระหว่างปุ่มในแนวแกนหลัก
          crossAxisSpacing: 20.0, // ระยะห่างระหว่างปุ่มในแนวแกนแนวนอน
          padding: EdgeInsets.all(10.0),
          childAspectRatio: 2,
          children: [
            buildElevatedButton(context, 'พยัญชนะไทย',
                const ThaiConsonantWidget(), const Color(0xFF8470FF)),
            buildElevatedButton(context, 'แบบฝึกหัด', const ThaiGameWidget(),
                const Color(0xFFDA70D6)),
          ],
        ),
      ),
    );
  }
}
