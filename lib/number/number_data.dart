class NumData {
  static final List<String> NumberEng = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
  ];

    static final List<String> audioPath = [
    'sound/num/0.mp3',
    'sound/num/1.mp3',
    'sound/num/2.mp3',
    'sound/num/3.mp3',
    'sound/num/4.mp3',
    'sound/num/5.mp3',
    'sound/num/6.mp3',
    'sound/num/7.mp3',
    'sound/num/8.mp3',
    'sound/num/9.mp3'
    

  ];

  static final List<String> images = [
    'image/number_images/app0.jpg',
    'image/number_images/app1.png',
    'image/number_images/app2.png',
    'image/number_images/app3.png',
    'image/number_images/app4.png',
    'image/number_images/app5.png',
    'image/number_images/app6.png',
    'image/number_images/app7.png',
    'image/number_images/app8.png',
    'image/number_images/app9.png'
  ];

  static final List<String> NumberThai = [
    '๐',
    '๑',
    '๒',
    '๓',
    '๔',
    '๕',
    '๖',
    '๗',
    '๘',
    '๙'
  ];
}

class Question {
  final String? imagePath;
  final String? audioPath;
  final List<String> optionImagePaths;
  final int correctAnswerIndex;

  const Question({
    required this.correctAnswerIndex,
    this.imagePath,
    this.audioPath,
    required this.optionImagePaths,
  });
}

const List<Question> questions = [
  Question(
    correctAnswerIndex: 0,
    optionImagePaths: [
      'image/number_images/app2.png',
      'image/number_images/app9.png',
    ],
    imagePath: 'image/number_images/question_1.png',
    audioPath: 'sound/num/2.mp3',// ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 1,
    optionImagePaths: [
      'image/number_images/app1.png',
      'image/number_images/app3.png',
    ],
    imagePath: 'image/number_images/question_2.png',
    audioPath: 'sound/num/3.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 1,
    optionImagePaths: [
      'image/number_images/app7.png',
      'image/number_images/app5.png',
    ],
    imagePath: 'image/number_images/question_3.png',
    audioPath: 'sound/num/5.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 0,
    optionImagePaths: [
      'image/number_images/app4.png',
      'image/number_images/app6.png',
    ],
    imagePath: 'image/number_images/question_4.png',
    audioPath: 'sound/num/4.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 1,
    optionImagePaths: [
      'image/number_images/app2.png',
      'image/number_images/app5.png',
    ],
    imagePath: 'image/number_images/question_5.png',
    audioPath: 'sound/num/5.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 0,
    optionImagePaths: [
      'image/number_images/app6.png',
      'image/number_images/app3.png',
    ],
    imagePath: 'image/number_images/question_6.png',
    audioPath: 'sound/num/6.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 0,
    optionImagePaths: [
      'image/number_images/app8.png',
      'image/number_images/app5.png',
    ],
    imagePath: 'image/number_images/question_7.png',
    audioPath: 'sound/num/8.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 1,
    optionImagePaths: [
      'image/number_images/app2.png',
      'image/number_images/app4.png',
    ],
    imagePath: 'image/number_images/question_8.png',
    audioPath: 'sound/num/4.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 1,
    optionImagePaths: [
      'image/number_images/app3.png',
      'image/number_images/app7.png',
    ],
    imagePath: 'image/number_images/question_9.png',
    audioPath: 'sound/num/7.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 1,
    optionImagePaths: [
      'image/number_images/app4.png',
      'image/number_images/app9.png',
    ],
    imagePath: 'image/number_images/question_10.png',
    audioPath: 'sound/num/9.mp3', // ใช้ path ของรูปภาพ
  ),
];
