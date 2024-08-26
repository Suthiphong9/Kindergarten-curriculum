import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'number_data.dart';

import 'number_thai.dart'; // เพิ่มการ import

class NumberEWidget extends StatefulWidget {
  const NumberEWidget({Key? key}) : super(key: key);

  @override
  _NumberEWidgetState createState() => _NumberEWidgetState();
}

class _NumberEWidgetState extends State<NumberEWidget> {
  int _currentIndex = 0;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'เลขอารบิก',
          style: TextStyle(fontFamily: 'ThaiLooped'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.swap_horiz),
            iconSize: 30.0,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NumberTWidget()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 20),
                Text(
                  NumData.NumberEng[_currentIndex],
                  style: TextStyle(fontSize: 400),
                ),
                Image.asset(
                  NumData.images[_currentIndex],
                  width: 700,
                  height: 500,
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _previousConsonant,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 148, 103, 253),
                    padding: EdgeInsets.symmetric(
                        horizontal: 70,
                        vertical: 20), // เปลี่ยนพื้นหลังเป็นสีเขียว
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 235, 221, 255),
                    size: 30,
                  ),
                ),
                SizedBox(width: 70),
                ElevatedButton(
                  onPressed: _playSound,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 171, 79, 187),
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                    // เปลี่ยนพื้นหลังเป็นสีเขียว
                  ),
                  child: Icon(
                    Icons.volume_up,
                    color: Color.fromARGB(255, 237, 255, 237),
                    size: 30,
                  ),
                ),
                SizedBox(width: 70),
                ElevatedButton(
                  onPressed: _nextConsonant,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 148, 103, 253),
                    padding: EdgeInsets.symmetric(
                        horizontal: 70,
                        vertical: 20), // เปลี่ยนพื้นหลังเป็นสีเขียว
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 235, 221, 255),
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _nextConsonant() {
    setState(() {
      if (_currentIndex < NumData.NumberEng.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _previousConsonant() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  void _playSound() {
    player.play(AssetSource(NumData.audioPath[_currentIndex]));
  }
}
