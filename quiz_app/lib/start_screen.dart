import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Image.asset('assets/images/quiz-logo.png',
            color: const Color.fromARGB(91, 255, 255, 255), width: 200),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Learning Flutter',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Start quiz',
              style: TextStyle(color: Colors.white),
            ))
      ]),
    );
  }
}
