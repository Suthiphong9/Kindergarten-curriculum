import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'zoo_answer.dart';
import '../zoo_data.dart';
import 'zoo_next_button.dart';
import 'zoo_result.dart';

class ZooGameWidget extends StatefulWidget {
  const ZooGameWidget({super.key});

  @override
  State<ZooGameWidget> createState() => _ZooGameWidgetState();
}

class _ZooGameWidgetState extends State<ZooGameWidget> {
  final player = AudioPlayer();
  // int _currentIndex = 0;
  // bool _isCorrect = true;
  // bool _showCorrectMessage = false;
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  @override
  void initState() {
    super.initState();
  }

  void _playSound() {
    final currentQuestion = questions[questionIndex];
    if (currentQuestion.audioPath != null) {
      player.play(AssetSource(currentQuestion.audioPath!));
    }
  }

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex != null &&
        selectedAnswerIndex == question.correctAnswerIndex) {
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

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ทายเสียงสัตว์',
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  question.optionImagePaths.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: selectedAnswerIndex == null
                          ? () => pickAnswer(index)
                          : null,
                      child: SizedBox(
                        width: 500, // Adjust the width
                        height: 400, // Adjust the height
                        child: AnswerCard(
                          currentIndex: index,
                          imagePath: question.optionImagePaths[index],
                          isSelected: selectedAnswerIndex == index,
                          selectedAnswerIndex: selectedAnswerIndex,
                          correctAnswerIndex: question.correctAnswerIndex,
                        ),
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
