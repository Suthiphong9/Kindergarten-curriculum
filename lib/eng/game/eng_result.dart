import 'package:flutter/material.dart';

import '../../main.dart';
import 'eng_game.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'คะแนน : ',
              style: TextStyle(
                fontFamily: 'ThaiLooped',
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      score.toString() + "/10",
                      style: const TextStyle(fontSize: 200),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่ตรงกลาง
              children: [
                ElevatedButton(
                  onPressed: () {
                    // นำผู้ใช้กลับไปหน้าแรก
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EngGameWidget(),
                      ),
                    );
                  },
                  child: const Text(
                    'เริ่มเกมใหม่',
                    style: TextStyle(fontFamily: 'ThaiLooped'),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(width: 100),
                ElevatedButton(
                  onPressed: () {
                    // นำผู้ใช้กลับไปหน้าแรก
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyApp(),
                      ),
                    );
                  },
                  child: const Text(
                    'กลับหน้าหลัก',
                    style: TextStyle(fontFamily: 'ThaiLooped'),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
