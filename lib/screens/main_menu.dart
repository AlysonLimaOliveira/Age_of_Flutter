import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/rpg_button.dart';
import 'quiz_page.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xFF4E342E), Color(0xFF212121)],
            radius: 1.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shield, size: 80, color: Colors.amber),
            const SizedBox(height: 20),
            Text(
              'AGE OF FLUTTER',
              textAlign: TextAlign.center,
              style: GoogleFonts.medievalSharp(
                fontSize: 50,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                shadows: [const Shadow(color: Colors.black, blurRadius: 10, offset: Offset(4, 4))],
              ),
            ),
            const Text(
              'A Profecia do Código',
              style: TextStyle(color: Colors.grey, fontSize: 18, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 60),
            RPGButton(
              label: "INICIAR JORNADA",
              color: Colors.red[900]!,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizPage()));
              },
            ),
            RPGButton(
              label: "CRÉDITOS",
              onPressed: () {
                _showCredits(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCredits(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF4E342E),
        title: const Text("CRÉDITOS", textAlign: TextAlign.center, style: TextStyle(color: Colors.amber)),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Age of Flutter", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("v1.0.0"),
            SizedBox(height: 20),
            Text("Equipe de Desenvolvimento:"),
            SizedBox(height: 10),
            Text("Mago: Thiago Sanson"),
            Text("Elfo: Jeliel Nunes"),
            Text("Anão: Alyson Oliveira"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("FECHAR", style: TextStyle(color: Colors.amber)),
          ),
        ],
      ),
    );
  }
}