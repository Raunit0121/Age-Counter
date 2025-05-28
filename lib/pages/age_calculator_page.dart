import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/summary_item.dart';
import '../widgets/dob_picker.dart';
import '../utils/age_utils.dart';

class AgeCalculatorPage extends StatefulWidget {
  @override
  _AgeCalculatorPageState createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  DateTime? birthDate;
  Map<String, dynamic> ageData = {};
  bool showResult = false;

  void calculateAge() {
    if (birthDate == null) return;
    ageData = AgeUtils.calculateAge(birthDate!);
    setState(() => showResult = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF333333),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 8)],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "🎉 Age Calculator 🎉",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                DobPicker(
                  birthDate: birthDate,
                  onDateSelected: (date) {
                    setState(() => birthDate = date);
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateAge,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Calculate Age",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                if (showResult) ...[
                  SizedBox(height: 30),
                  Text(
                    "Your Age",
                    style: TextStyle(fontSize: 22, color: Colors.orangeAccent),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      SummaryItem(label: "Years", value: "${ageData['years']}"),
                      SummaryItem(
                        label: "Months",
                        value: "${ageData['months']}",
                      ),
                      SummaryItem(label: "Days", value: "${ageData['days']}"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Next Birthday",
                    style: TextStyle(fontSize: 18, color: Colors.orangeAccent),
                  ),
                  SizedBox(height: 6),
                  Text(
                    ageData['nextBirthday'],
                    style: TextStyle(color: Colors.orange, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Summary",
                    style: TextStyle(fontSize: 18, color: Colors.orangeAccent),
                  ),
                  SizedBox(height: 10),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  

                    children: [
                      SummaryItem(
                        label: "Years",
                        value: "${ageData['totalYears']}",
                      ),
                      SummaryItem(
                        label: "Months",
                        value: "${ageData['totalMonths']}",
                      ),
                      SummaryItem(
                        label: "Weeks",
                        value: "${ageData['totalWeeks']}",
                      ),
                      SummaryItem(
                        label: "Days",
                        value: "${ageData['totalDays']}",
                      ),
                      SummaryItem(
                        label: "Hours",
                        value: "${ageData['totalHours']}",
                      ),
                      SummaryItem(
                        label: "Minutes",
                        value: "${ageData['totalMinutes']}",
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
