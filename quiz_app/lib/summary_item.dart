import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_identifies.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.item, super.key});
  final Map<String, Object> item;
  @override
  Widget build(BuildContext context) {
    var isCorrectAnswer = item['correct_answer'] == item['selected_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            questionIndex: item['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['question'].toString(),
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                item['correct_answer'].toString(),
                style:
                    const TextStyle(color: Color.fromARGB(255, 150, 198, 241)),
              ),
              Text(
                item['selected_answer'].toString(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 249, 133, 241),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
