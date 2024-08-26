import 'package:flutter/material.dart';
import 'game/number_game.dart';
import 'number_eng.dart';
import 'number_thai.dart';

class NumWidget extends StatefulWidget {
  const NumWidget({Key? key}) : super(key: key);

  @override
  State<NumWidget> createState() => _NumWidgetState();
}

class _NumWidgetState extends State<NumWidget> {
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
          'ตัวเลข',
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
          childAspectRatio: 2.0, // จำนวนคอลัม
          //0xFF228B22
          children: [
            buildElevatedButton(context, 'เลขอารบิก/เลขไทย',
                const NumberEWidget(), const Color(0xFF228B22)),
            buildElevatedButton(context, 'แบบฝึกหัด', const NumberGameWidget(),
                Color.fromARGB(255, 216, 202, 13)),
          ],
        ),
      ),
    );
  }
}
