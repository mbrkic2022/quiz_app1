import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.selectedAnswers, required this.restart, super.key});
  final void Function() restart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': question[i].text,
        'selected_answer': selectedAnswers[i],
        'correct_answer': question[i].answers[0]
      });
    }
    return summary;
  }

  final List<String> selectedAnswers;
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    var totalAnswers = question.length;
    var correctAnswers = summaryData
        .where((element) =>
            element['selected_answer'] == element['correct_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'You got $correctAnswers out of $totalAnswers correctly!',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(child: Summary(summaryData: summaryData)),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: restart,
              label: const Text(
                'Restart quiz',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
