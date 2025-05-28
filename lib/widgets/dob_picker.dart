import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DobPicker extends StatelessWidget {
  final DateTime? birthDate;
  final Function(DateTime) onDateSelected;

  const DobPicker({required this.birthDate, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime(2000),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (date != null) onDateSelected(date);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xFF444444),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              birthDate != null
                  ? DateFormat.yMMMd().format(birthDate!)
                  : "Select Date of Birth",
              style: TextStyle(color: Colors.white),
            ),
            Icon(Icons.calendar_today, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
