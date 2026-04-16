class Question {
  final String text;
  final List<String> options;
  final int correctAnswerIndex;
  final String monsterName;
  final String? backgroundImage;

  Question(this.text, this.options, this.correctAnswerIndex, this.monsterName, {this.backgroundImage});
}