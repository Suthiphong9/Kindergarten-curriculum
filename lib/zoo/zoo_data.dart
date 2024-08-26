class ZooData {
  static final List<String> imagePaths = [
    'image/zoo_images/chicken.png',
    'image/zoo_images/horse.png',
    'image/zoo_images/elephant.png',
    'image/zoo_images/frog.png',
    'image/zoo_images/cow.png',
    'image/zoo_images/duck.png',
    'image/zoo_images/eagle.png',
    'image/zoo_images/monkey.png',
    'image/zoo_images/pig.png',
    'image/zoo_images/cat.png',
    'image/zoo_images/lion.png',
    'image/zoo_images/dog.png'
  ];

  static final List<String> audioPaths = [
    'sound/zoo/chicken.mp3',
    'sound/zoo/horse.mp3',
    'sound/zoo/elephant.mp3',
    'sound/zoo/frog.mp3',
    'sound/zoo/cow.mp3',
    'sound/zoo/duck.mp3',
    'sound/zoo/eagle.mp3',
    'sound/zoo/monkey.mp3',
    'sound/zoo/pig.mp3',
    'sound/zoo/cat.mp3',
    'sound/zoo/lion.mp3',
    'sound/zoo/dog.mp3',
  ];
}

class Question {
  final String? audioPath;
  final List<String> optionImagePaths;
  final int correctAnswerIndex;

  const Question({
    required this.correctAnswerIndex,
    this.audioPath,
    required this.optionImagePaths,
  });
}

const List<Question> questions = [
  Question(
    correctAnswerIndex: 0,
    optionImagePaths: [
      'image/zoo_images/chicken.png',
      'image/zoo_images/cow.png',
    ],
    audioPath: 'sound/zoo/chicken.mp3',
  ),
  Question(
    correctAnswerIndex: 0,
    optionImagePaths: [
      'image/zoo_images/cat.png',
      'image/zoo_images/dog.png',
    ],
    audioPath: 'sound/zoo/cat.mp3',
  ),
  Question(
    correctAnswerIndex: 1,
    optionImagePaths: [
      'image/zoo_images/duck.png',
      'image/zoo_images/elephant.png',
    ],
    audioPath: 'sound/zoo/elephant.mp3',
  ),
  Question(
    correctAnswerIndex: 0,
    optionImagePaths: [
      'image/zoo_images/pig.png',
      'image/zoo_images/monkey.png',
    ],
    audioPath: 'sound/zoo/pig.mp3',
  ),
  Question(
    correctAnswerIndex: 0,
    optionImagePaths: [
      'image/zoo_images/lion.png',
      'image/zoo_images/dog.png',
    ],
    audioPath: 'sound/zoo/lion.mp3',
  ),
  Question(
    correctAnswerIndex: 1,
    optionImagePaths: [
      'image/zoo_images/cow.png',
      'image/zoo_images/horse.png',
    ],
    audioPath: 'sound/zoo/horse.mp3',
  ),
  Question(
    correctAnswerIndex: 1,
    optionImagePaths: [
      'image/zoo_images/chicken.png',
      'image/zoo_images/monkey.png',
    ],
    audioPath: 'sound/zoo/monkey.mp3',
  ),
  Question(
    correctAnswerIndex: 1,
    optionImagePaths: [
      'image/zoo_images/eagle.png',
      'image/zoo_images/cow.png',
    ],
    audioPath: 'sound/zoo/cow.mp3',
  ),
  Question(
    correctAnswerIndex: 1,
    optionImagePaths: [
      'image/zoo_images/chicken.png',
      'image/zoo_images/eagle.png',
    ],
    audioPath: 'sound/zoo/eagle.mp3',
  ),
  Question(
    correctAnswerIndex: 0,
    optionImagePaths: [
      'image/zoo_images/lion.png',
      'image/zoo_images/dog.png',
    ],
    audioPath: 'sound/zoo/dog.mp3',
  ),
];
