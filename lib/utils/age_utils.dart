import 'package:flutter/material.dart';

class AgeUtils {
  static Map<String, dynamic> calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int years = today.year - birthDate.year;
    int months = today.month - birthDate.month;
    int days = today.day - birthDate.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += 12;
    }

    if (days < 0) {
      final lastMonthDate = DateTime(today.year, today.month, 0).day;
      days += lastMonthDate;
      months--;
    }

    int totalYears = years;
    int totalMonths = totalYears * 12 + today.month - birthDate.month;
    int totalDays = today.difference(birthDate).inDays;
    int totalWeeks = totalDays ~/ 7;
    int totalHours = totalDays * 24;
    int totalMinutes = totalHours * 60;

    DateTime nextBirthday = DateTime(today.year, birthDate.month, birthDate.day);
    if (nextBirthday.isBefore(today)) {
      nextBirthday = DateTime(today.year + 1, birthDate.month, birthDate.day);
    }

    final daysToBirthday = nextBirthday.difference(today).inDays;
    String nextBirthdayInfo = daysToBirthday == 0
        ? "Today is your birthday!"
        : daysToBirthday < 30
        ? "In $daysToBirthday days"
        : "In ${(nextBirthday.month - today.month + 12) % 12} month${((nextBirthday.month - today.month + 12) % 12) > 1 ? 's' : ''}";

    return {
      'years': years,
      'months': months,
      'days': days,
      'totalYears': totalYears,
      'totalMonths': totalMonths,
      'totalWeeks': totalWeeks,
      'totalDays': totalDays,
      'totalHours': totalHours,
      'totalMinutes': totalMinutes,
      'nextBirthday': nextBirthdayInfo
    };
  }
}
