import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final Widget question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    // Color defaultBorderColor = const Color.fromARGB(255, 0, 0, 0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7),
      child: selectedAnswerIndex != null
          // if one option is chosen
          ? Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isCorrectAnswer
                    ? Colors.green
                        .withOpacity(0.2) // ใช้สีพื้นหลังเขียวเมื่อคำตอบถูก
                    : isWrongAnswer
                        ? Colors.red
                            .withOpacity(0.2) // ใช้สีพื้นหลังแดงเมื่อคำตอบผิด
                        : Colors.white10,
                border: Border.all(
                  color: isCorrectAnswer
                      ? Colors.green
                      : isWrongAnswer
                          ? Colors.red
                          : Colors.black,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: question,
                  ),
                  isCorrectAnswer
                      ? buildCorrectIcon()
                      : isWrongAnswer
                          ? buildWrongIcon()
                          : const SizedBox.shrink(),
                ],
              ),
            )

          // If no option is selected
          : Container(
              
              decoration: BoxDecoration(
                // color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: question,
                  ),
                ],
              ),
            ),
    );
  }
}

Widget buildCorrectIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

Widget buildWrongIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
