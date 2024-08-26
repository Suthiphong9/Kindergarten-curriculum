import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'thai_answer.dart';
import 'thai_next_button.dart';
import 'thai_result.dart';
import '../thai_data.dart';

class ThaiGameWidget extends StatefulWidget {
  const ThaiGameWidget({Key? key}) : super(key: key);

  @override
  State<ThaiGameWidget> createState() => _ThaiGameWidgetState();
}

class _ThaiGameWidgetState extends State<ThaiGameWidget> {
  // int _currentIndex = 0;
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
          'แบบฝึกหัดภาษาไทย',
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
            // แสดงเฉพาะรูปภาพแทนข้อความคำถาม
            if (question.imagePath != null)
              Image.asset(
                question.imagePath!,
                width: 800,
                height: 450,
                fit: BoxFit.cover,
              ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
