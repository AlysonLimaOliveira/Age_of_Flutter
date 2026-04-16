import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/rpg_button.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _hp = 3;
  int _score = 0;

  final List<Question> _questions = [
    Question(
      "O que é um Widget?",
      ["Ferramenta", "Tudo na UI", "Banco de dados"],
      1,
      "O Ogro de Layout",
      backgroundImage: "assets/images/ogro.png",
    ),
    Question(
      "Qual linguagem o Flutter usa?",
      ["Java", "Kotlin", "Dart"],
      2,
      "A Serpente de Script",
      backgroundImage: "assets/images/serpente.png",
    ),
    Question(
      "O que faz o Hot Reload?",
      ["Compila APK", "Atualiza a UI", "Reinicia PC"],
      1,
      "O Mago do Tempo",
      backgroundImage: "assets/images/mago.png",
    ),
  ];

  void _answerQuestion(int index) {
    setState(() {
      if (index == _questions[_currentQuestionIndex].correctAnswerIndex) {
        _score += 100;
      } else {
        _hp -= 1;
      }

      if (_hp <= 0 || _currentQuestionIndex >= _questions.length - 1) {
        _showGameOver();
      } else {
        _currentQuestionIndex++;
      }
    });
  }

  void _showGameOver() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF4E342E),
        title: Text(_hp <= 0 ? "FALHA NA MISSÃO!" : "VITÓRIA!"),
        content: Text("Ouro coletado: $_score"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: const Text("VOLTAR AO MENU", style: TextStyle(color: Colors.amber)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Vida: " + "❤️" * _hp),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: question.backgroundImage != null
              ? DecorationImage(
            image: AssetImage(question.backgroundImage!),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken,
            ),
          )
              : null,
          gradient: question.backgroundImage == null
              ? const RadialGradient(
            colors: [Color(0xFF4E342E), Color(0xFF212121)],
            radius: 1.2,
          )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(question.monsterName,
                  style: const TextStyle(fontSize: 28, color: Colors.redAccent, fontWeight: FontWeight.bold)),
              const Divider(color: Colors.amber),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.black54,
                child: Text(question.text, style: const TextStyle(fontSize: 22), textAlign: TextAlign.center),
              ),
              const Spacer(),
              ...List.generate(question.options.length, (i) {
                return RPGButton(
                  label: question.options[i],
                  onPressed: () => _answerQuestion(i),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
