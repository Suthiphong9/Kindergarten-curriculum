import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  final String imagePath;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: selectedAnswerIndex != null
          // หากเลือกคำตอบแล้ว
          ? Container(
              height: 200,
              padding: const EdgeInsets.all(10.0),
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
                children: [
                  Expanded(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  isCorrectAnswer
                      ? buildCorrectIcon()
                      : isWrongAnswer
                          ? buildWrongIcon()
                          : const SizedBox.shrink(),
                ],
              ),
            )

          // หากยังไม่ได้เลือกคำตอบ
          : Container(
              height: 200,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
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
