import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:http/http.dart' as http;

class ButtomLedWidget extends StatefulWidget {
  const ButtomLedWidget({super.key});

  @override
  _ButtomLedWidgetState createState() => _ButtomLedWidgetState();
}

class _ButtomLedWidgetState extends State<ButtomLedWidget> {
  final SpeechToText _speech = SpeechToText();
  bool speechEnabled = false;
  String _wordsSpoken = "";
  double _confidenceLevel = 0;
  final String baseUrl = 'http://172.20.10.2'; // IP ของ ESP8266 ของคุณ

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    speechEnabled = await _speech.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speech.listen(onResult: _onSpeechResult);
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speech.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
      _confidenceLevel = result.confidence;

      // เรียกใช้ฟังก์ชันที่ควบคุมไฟ LED
      _controlLed(_wordsSpoken);
    });
  }

  Future<void> _controlLed(String command) async {
    final lowerCaseCommand = command.toLowerCase();
    if (lowerCaseCommand == 'turn on a') {
      await http.get(Uri.parse('$baseUrl/led/on/a'));
    } else if (lowerCaseCommand == 'turn on b') {
      await http.get(Uri.parse('$baseUrl/led/on/b'));
    } else if (lowerCaseCommand == 'turn on c') {
      await http.get(Uri.parse('$baseUrl/led/on/all'));
    } else if (lowerCaseCommand == 'bye') {
      await http.get(Uri.parse('$baseUrl/led/off/all'));
    }
  }

  Future<void> _sendCommand(String command) async {
    final url = Uri.parse('$baseUrl/$command');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('Success: $command');
      } else {
        print('Failed to send command: $command');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _sendTextToSerial(String text) async {
    await http.get(Uri.parse(
        '$baseUrl/sendText?text=$text')); // ส่งข้อความไปยัง Serial Monitor
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('พูดกับหุ่นยนต์'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                _speech.isListening
                    ? "กำลังฟัง..."
                    : speechEnabled
                        ? "แตะปุ่มเพื่อเริ่มพูด"
                        : "Speech not available",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  _wordsSpoken,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            if (_speech.isNotListening && _confidenceLevel > 0)
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Text(
                  "ความใกล้เคียง : ${(_confidenceLevel * 100).toStringAsFixed(1)}%",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            Wrap(
              spacing: 16.0, // ระยะห่างแนวนอน
              runSpacing: 16.0, // ระยะห่างแนวตั้ง
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _sendCommand('led/on/a');
                    _sendTextToSerial('turn on a');
                  },
                  child: const Text('เปิดไฟ หลอดที่ 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _sendCommand('led/on/b');
                    _sendTextToSerial('turn on b');
                  },
                  child: const Text('เปิดไฟ หลอดที่ 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _sendCommand('led/on/all');
                    _sendTextToSerial('turn on c');
                  },
                  child: const Text('เปิดไฟ ทั้ง 2 หลอด'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _sendCommand('led/off/all');
                    _sendTextToSerial('bye');
                  },
                  child: const Text('ปิดไฟ'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _speech.isListening ? _stopListening : _startListening,
        tooltip: 'เริ่ม/หยุดฟัง',
        child: Icon(
          _speech.isNotListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
