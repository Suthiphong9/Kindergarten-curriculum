import 'package:flutter/material.dart';
import 'eng_consonant.dart';
import 'game/eng_game.dart';

class EngConsonantsWidget extends StatefulWidget {
  const EngConsonantsWidget({Key? key}) : super(key: key);

  @override
  _EngConsonantsWidgetState createState() => _EngConsonantsWidgetState();
}

class _EngConsonantsWidgetState extends State<EngConsonantsWidget> {
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
          'ภาษาอังกฤษ',
          style: TextStyle(fontFamily: 'ThaiLooped'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 100.0, // ระยะห่างระหว่างปุ่มในแนวแกนหลัก
          crossAxisSpacing: 20.0, // ระยะห่างระหว่างปุ่มในแนวแกนแนวนอน
          padding: EdgeInsets.all(10.0),
          childAspectRatio: 2.0,
          children: [
            buildElevatedButton(context, 'อักษรอังกฤษ',
                const EngConsonantWidget(), Color.fromARGB(255, 73, 163, 253)),
            buildElevatedButton(context, 'แบบฝึกหัด', const EngGameWidget(),
                Color.fromARGB(255, 43, 74, 168)),
          ],
        ),
      ),
    );
  }
}
