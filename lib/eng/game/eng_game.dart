import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../eng_data.dart';
import 'eng_answer.dart';
import 'eng_next_button.dart';
import 'eng_result.dart';

class EngGameWidget extends StatefulWidget {
  const EngGameWidget({super.key});

  @override
  State<EngGameWidget> createState() => _EngGameWidgetState();
}

class _EngGameWidgetState extends State<EngGameWidget> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  final player = AudioPlayer();

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;

      player.play(AssetSource('correct.mp3'));
    } else {
      player.play(AssetSource('wrong.mp3'));
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }
    void _playSound() {
    final currentQuestion = questions[questionIndex];
    if (currentQuestion.audioPath != null) {
      player.play(AssetSource(currentQuestion.audioPath!));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'แบบฝึกหัดภาษาอังกฤษ',
          style: TextStyle(fontFamily: 'ThaiLooped'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'คำถามที่: ${questionIndex + 1}/${questions.length}', // xx/xx
              style: const TextStyle(
                fontFamily: 'ThaiLooped',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // จัดตำแหน่งกลาง
              children: [
                Flexible(
                  child: Container(
                    color:
                        Color.fromARGB(255, 255, 255, 255), // กำหนดสีพื้นหลัง
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // เพิ่ม padding แนวนอน
                    alignment:
                        Alignment.center, // จัดตำแหน่งข้อความให้อยู่ตรงกลาง
                    child: Text(
                      question.question, // แสดงคำถาม
                      style: const TextStyle(
                        fontSize: 300,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0), // กำหนดสีข้อความ
                      ),
                      textAlign: TextAlign.center, // จัดข้อความให้อยู่ตรงกลาง
                    ), // แสดง ... ถ้าข้อความยาวเกินไป
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  question.options.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: selectedAnswerIndex == null
                          ? () => pickAnswer(index)
                          : null,
                      child: AnswerCard(
                        currentIndex: index,
                        question: question.options[index],
                        isSelected: selectedAnswerIndex == index,
                        selectedAnswerIndex: selectedAnswerIndex,
                        correctAnswerIndex: question.correctAnswerIndex,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _playSound,
              child: const Icon(Icons.volume_up),
            ),
            isLastQuestion
                ? RectangularButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => ResultScreen(
                            score: score,
                          ),
                        ),
                      );
                    },
                    label: 'Finish',
                  )
                : RectangularButton(
                    onPressed:
                        selectedAnswerIndex != null ? goToNextQuestion : null,
                    label: 'Next',
                  ),
          ],
        ),
      ),
    );
  }
}
