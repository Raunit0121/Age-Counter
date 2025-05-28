import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  final String label;
  final String value;

  const SummaryItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF444444),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: 18, color: Colors.white)),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
