import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'thai_data.dart';

class ThaiConsonantWidget extends StatefulWidget {
  const ThaiConsonantWidget({super.key});

  @override
  State<ThaiConsonantWidget> createState() => ThaiConsonantWidgetState();
}

class ThaiConsonantWidgetState extends State<ThaiConsonantWidget> {
  int _currentIndex = 0;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'พยัญชนะไทย',
          style: TextStyle(fontFamily: 'ThaiLooped'),
        ),
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
                  ThaiData.consonants[_currentIndex],
                  style: TextStyle(fontFamily: 'ThaiLooped', fontSize: 400),
                ),
                Image.asset(
                  ThaiData.images[_currentIndex],
                  width: 700,
                  height: 500,
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 148, 103, 253),
                  padding: EdgeInsets.symmetric(
                      horizontal: 70,
                      vertical: 20), // เปลี่ยนพื้นหลังเป็นสีเขียว
                ),
                onPressed: _nextConsonant,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromARGB(255, 235, 221, 255),
                  size: 30,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
  

  void _nextConsonant() {
    setState(() {
      if (_currentIndex < ThaiData.consonants.length - 1) {
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
    player.play(AssetSource(ThaiData.audioPath[_currentIndex]));
  }
}
