import 'package:flutter/material.dart';

class EngData {
  static final List<String> consonants = [
    'image/eng_images/A.gif',
    'image/eng_images/B.gif',
    'image/eng_images/C.gif',
    'image/eng_images/D.gif',
    'image/eng_images/E.gif',
    'image/eng_images/F.gif',
    'image/eng_images/G.gif',
    'image/eng_images/H.gif',
    'image/eng_images/I.gif',
    'image/eng_images/J.gif',
    'image/eng_images/K.gif',
    'image/eng_images/L.gif',
    'image/eng_images/M.gif',
    'image/eng_images/N.gif',
    'image/eng_images/O.gif',
    'image/eng_images/P.gif',
    'image/eng_images/Q.gif',
    'image/eng_images/R.gif',
    'image/eng_images/S.gif',
    'image/eng_images/T.gif',
    'image/eng_images/U.gif',
    'image/eng_images/V.gif',
    'image/eng_images/W.gif',
    'image/eng_images/X.gif',
    'image/eng_images/Y.gif',
    'image/eng_images/Z.gif'
  ];

  static final List<String> audioPath = [
    'sound/eng/a.mp3',
    'sound/eng/b.mp3',
    'sound/eng/c.mp3',
    'sound/eng/d.mp3',
    'sound/eng/e.mp3',
    'sound/eng/f.mp3',
    'sound/eng/g.mp3',
    'sound/eng/h.mp3',
    'sound/eng/i.mp3',
    'sound/eng/j.mp3',
    'sound/eng/k.mp3',
    'sound/eng/l.mp3',
    'sound/eng/m.mp3',
    'sound/eng/n.mp3',
    'sound/eng/o.mp3',
    'sound/eng/p.mp3',
    'sound/eng/q.mp3',
    'sound/eng/r.mp3',
    'sound/eng/s.mp3',
    'sound/eng/t.mp3',
    'sound/eng/u.mp3',
    'sound/eng/v.mp3',
    'sound/eng/w.mp3',
    'sound/eng/x.mp3',
    'sound/eng/y.mp3',
    'sound/eng/z.mp3'
  ];
}

class Question {
  final String question;
  final String? audioPath;
  final List<Widget> options;
  final int correctAnswerIndex;

  const Question({
    required this.question,
    required this.options,
    this.audioPath,
    required this.correctAnswerIndex,
  });
}

List<Question> questions = [
  Question(
    question: 'A',
    correctAnswerIndex: 0,
    options: [
      Row(
        children: [
          Image.asset(
            'image/number_images/app1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'a',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            'image/eng_images/b1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'b',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
    ],
    audioPath: 'sound/eng/a.mp3',
  ),
  Question(
    question: 'B',
    correctAnswerIndex: 0,
    options: [
      Row(
        children: [
          Image.asset(
            'image/eng_images/b1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'b',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            'image/eng_images/f1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'f',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
    ],
    audioPath: 'sound/eng/b.mp3',
  ),
  Question(
    question: 'G',
    correctAnswerIndex: 1,
    options: [
      Row(
        children: [
          Image.asset(
            'image/eng_images/p1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'p',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            'image/eng_images/g1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'g',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
    ],
  audioPath: 'sound/eng/g.mp3',
  ),
  Question(
    question: 'S',
    correctAnswerIndex: 0,
    options: [
      Row(
        children: [
          Image.asset(
            'image/eng_images/s1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            's',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            'image/eng_images/e1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'e',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
    ],
  audioPath: 'sound/eng/s.mp3',
  ),
  Question(
    question: 'I',
    correctAnswerIndex: 0,
    options: [
      Row(
        children: [
          Image.asset(
            'image/eng_images/i1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'i',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            'image/eng_images/j1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'j',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
    ],
  audioPath: 'sound/eng/i.mp3',
  ),
  Question(
    question: 'O',
    correctAnswerIndex: 1,
    options: [
      Row(
        children: [
          Image.asset(
            'image/eng_images/m1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'm',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            'image/eng_images/o1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'o',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
    ],
  audioPath: 'sound/eng/o.mp3',
  ),
  Question(
    question: 'C',
    correctAnswerIndex: 0,
    options: [
      Row(
        children: [
          Image.asset(
            'image/eng_images/c1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'c',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            'image/eng_images/m1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'm',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
    ],
  audioPath: 'sound/eng/c.mp3',
  ),
  Question(
    question: 'T',
    correctAnswerIndex: 1,
    options: [
      Row(
        children: [
          Image.asset(
            'image/eng_images/y1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'y',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            'image/eng_images/t1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            't',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
    ],
  audioPath: 'sound/eng/t.mp3',
  ),
  Question(
    question: 'W',
    correctAnswerIndex: 0,
    options: [
      Row(
        children: [
          Image.asset(
            'image/eng_images/w1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'w',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            'image/eng_images/s1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            's',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
    ],
  audioPath: 'sound/eng/w.mp3',
  ),
  Question(
    question: 'Z',
    correctAnswerIndex: 1,
    options: [
      Row(
        children: [
          Image.asset(
            'image/eng_images/g1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'g',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            'image/eng_images/z1.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'z',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
    ],
  audioPath: 'sound/eng/z.mp3',
  ),
];
