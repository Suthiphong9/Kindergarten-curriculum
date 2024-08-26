class ThaiData {
  static final List<String> consonants = [
    'ก',
    'ข',
    'ฃ',
    'ค',
    'ฅ',
    'ฆ',
    'ง',
    'จ',
    'ฉ',
    'ช',
    'ซ',
    'ฌ',
    'ญ',
    'ฎ',
    'ฏ',
    'ฐ',
    'ฑ',
    'ฒ',
    'ณ',
    'ด',
    'ต',
    'ถ',
    'ท',
    'ธ',
    'น',
    'บ',
    'ป',
    'ผ',
    'ฝ',
    'พ',
    'ฟ',
    'ภ',
    'ม',
    'ย',
    'ร',
    'ล',
    'ว',
    'ศ',
    'ษ',
    'ส',
    'ห',
    'ฬ',
    'อ',
    'ฮ'
  ];

  static final List<String> audioPath = [
    'sound/thai/t1.mp3',
    'sound/thai/t2.mp3',
    'sound/thai/t3.mp3',
    'sound/thai/t4.mp3',
    'sound/thai/t5.mp3',
    'sound/thai/t6.mp3',
    'sound/thai/t7.mp3',
    'sound/thai/t8.mp3',
    'sound/thai/t9.mp3',
    'sound/thai/t10.mp3',
    'sound/thai/t11.mp3',
    'sound/thai/t12.mp3',
    'sound/thai/t13.mp3',
    'sound/thai/t14.mp3',
    'sound/thai/t15.mp3',
    'sound/thai/t16.mp3',
    'sound/thai/t17.mp3',
    'sound/thai/t18.mp3',
    'sound/thai/t19.mp3',
    'sound/thai/t20.mp3',
    'sound/thai/t21.mp3',
    'sound/thai/t22.mp3',
    'sound/thai/t23.mp3',
    'sound/thai/t24.mp3',
    'sound/thai/t25.mp3',
    'sound/thai/t26.mp3',
    'sound/thai/t27.mp3',
    'sound/thai/t28.mp3',
    'sound/thai/t29.mp3',
    'sound/thai/t30.mp3',
    'sound/thai/t31.mp3',
    'sound/thai/t32.mp3',
    'sound/thai/t33.mp3',
    'sound/thai/t34.mp3',
    'sound/thai/t35.mp3',
    'sound/thai/t36.mp3',
    'sound/thai/t37.mp3',
    'sound/thai/t38.mp3',
    'sound/thai/t39.mp3',
    'sound/thai/t40.mp3',
    'sound/thai/t41.mp3',
    'sound/thai/t42.mp3',
    'sound/thai/t43.mp3',
    'sound/thai/t44.mp3'
  ];

  static final List<String> images = [
    'image/thai_images/th_1.png',
    'image/thai_images/th_2.png',
    'image/thai_images/th_3.png',
    'image/thai_images/th_4.png',
    'image/thai_images/th_5.png',
    'image/thai_images/th_6.png',
    'image/thai_images/th_7.png',
    'image/thai_images/th_8.png',
    'image/thai_images/th_9.png',
    'image/thai_images/th_10.png',
    'image/thai_images/th_11.png',
    'image/thai_images/th_12.png',
    'image/thai_images/th_13.png',
    'image/thai_images/th_14.png',
    'image/thai_images/th_15.png',
    'image/thai_images/th_16.png',
    'image/thai_images/th_17.png',
    'image/thai_images/th_18.png',
    'image/thai_images/th_19.png',
    'image/thai_images/th_20.png',
    'image/thai_images/th_21.png',
    'image/thai_images/th_22.png',
    'image/thai_images/th_23.png',
    'image/thai_images/th_24.png',
    'image/thai_images/th_25.png',
    'image/thai_images/th_26.png',
    'image/thai_images/th_27.png',
    'image/thai_images/th_28.png',
    'image/thai_images/th_29.png',
    'image/thai_images/th_30.png',
    'image/thai_images/th_31.png',
    'image/thai_images/th_32.png',
    'image/thai_images/th_33.png',
    'image/thai_images/th_34.png',
    'image/thai_images/th_35.png',
    'image/thai_images/th_36.png',
    'image/thai_images/th_37.png',
    'image/thai_images/th_38.png',
    'image/thai_images/th_39.png',
    'image/thai_images/th_40.png',
    'image/thai_images/th_41.png',
    'image/thai_images/th_42.png',
    'image/thai_images/th_43.png',
    'image/thai_images/th_44.png'
  ];
}

class Question {
  final String? imagePath;
  final String? audioPath;
  final List<String> options;
  final int correctAnswerIndex;

  const Question({
    required this.correctAnswerIndex,
    this.imagePath,
    this.audioPath,
    required this.options,
  });
}

const List<Question> questions = [
  Question(
    correctAnswerIndex: 0,
    options: [
      'ก',
      'ค',
    ],
    imagePath: 'image/thai_images/th_1.png',
    audioPath: 'sound/thai/t1.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 1,
    options: [
      'อ',
      'ข',
    ],
    imagePath: 'image/thai_images/th_2.png',
    audioPath: 'sound/thai/t2.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 0,
    options: [
      'ช',
      'ง',
    ],
    imagePath: 'image/thai_images/th_10.png',
    audioPath: 'sound/thai/t10.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 0,
    options: [
      'ฟ',
      'ด',
    ],
    imagePath: 'image/thai_images/th_31.png',
    audioPath: 'sound/thai/t31.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 0,
    options: [
      'ล',
      'ร',
    ],
    imagePath: 'image/thai_images/th_36.png',
    audioPath: 'sound/thai/t36.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 1,
    options: [
      'ถ',
      'ท',
    ],
    imagePath: 'image/thai_images/th_23.png',
    audioPath: 'sound/thai/t23.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 0,
    options: [
      'น',
      'บ',
    ],
    imagePath: 'image/thai_images/th_25.png',
    audioPath: 'sound/thai/t25.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 1,
    options: [
      'ห',
      'ณ',
    ],
    imagePath: 'image/thai_images/th_19.png',
    audioPath: 'sound/thai/t19.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 0,
    options: [
      'ส',
      'อ',
    ],
    imagePath: 'image/thai_images/th_40.png',
    audioPath: 'sound/thai/t40.mp3', // ใช้ path ของรูปภาพ
  ),
  Question(
    correctAnswerIndex: 1,
    options: [
      'พ',
      'ฮ',
    ],
    imagePath: 'image/thai_images/th_44.png',
    audioPath: 'sound/thai/t44.mp3', // ใช้ path ของรูปภาพ
  ),
];
