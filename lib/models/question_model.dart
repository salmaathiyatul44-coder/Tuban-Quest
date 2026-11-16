class QuestionModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;

  QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  });
}

final Map<String, List<QuestionModel>> locationQuestions = {
  'Alun-Alun Tuban': [
    QuestionModel(
      question: 'Landmark khas yang berada di pusat Kota Tuban adalah...',
      options: ['Alun-Alun Tuban', 'Tugu Pahlawan', 'Candi Borobudur', 'Monas'],
      correctAnswerIndex: 0,
      explanation: 'Alun-Alun Tuban merupakan pusat kegiatan masyarakat dan simbol kebudayaan Kota Tuban.',
    ),
  ],
  'Kelenteng Kwan Sing Bio': [
    QuestionModel(
      question: 'Kelenteng Kwan Sing Bio dikenal unik karena memiliki simbol hewan...',
      options: ['Naga', 'Kepiting', 'Harimau', 'Burung Rajawali'],
      correctAnswerIndex: 1,
      explanation: 'Kelenteng Kwan Sing Bio merupakan satu-satunya kelenteng di Asia Tenggara yang menggunakan simbol Kepiting Raksasa di gerbang utamanya.',
    ),
  ],
  'Gua Akbar': [
    QuestionModel(
      question: 'Gua bersejarah yang terletak tepat di bawah pasar modern Tuban adalah...',
      options: ['Gua Maharani', 'Gua Gong', 'Gua Akbar', 'Gua Pindul'],
      correctAnswerIndex: 2,
      explanation: 'Gua Akbar merupakan gua alam bersejarah yang unik karena lokasinya berada di tengah kota, di bawah Pasar Baru Tuban.',
    ),
  ],
};