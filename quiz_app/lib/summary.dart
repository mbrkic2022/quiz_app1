import 'package:flutter/material.dart';
import 'package:quiz_app/summary_item.dart';

class Summary extends StatelessWidget {
  const Summary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((e) => SummaryItem(item: e)).toList(),
    );
  }
}
