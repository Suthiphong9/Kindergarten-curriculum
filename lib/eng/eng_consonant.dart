import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'eng_data.dart';

class EngConsonantWidget extends StatefulWidget {
  const EngConsonantWidget({super.key});

  @override
  State<EngConsonantWidget> createState() => _EngConsonantWidgetState();
}

class _EngConsonantWidgetState extends State<EngConsonantWidget> {
  int _currentIndex = 0;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'อักษรอังกฤษ',
          style: TextStyle(fontFamily: 'ThaiLooped'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              EngData.consonants[_currentIndex],
              width: 1000,
              height: 600,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _previousEng,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 148, 103, 253),
                    padding: EdgeInsets.symmetric(
                        horizontal: 70,
                        vertical: 20), // เปลี่ยนพื้นหลังเป็นสีเขียว
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 237, 255, 237),
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
                  onPressed: _nextEng,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 237, 255, 237),
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

  void _nextEng() {
    setState(() {
      if (_currentIndex < EngData.consonants.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _previousEng() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }
  void _playSound() {
    player.play(AssetSource(EngData.audioPath[_currentIndex]));
  }
}
