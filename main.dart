import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add opening brace here
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController tmController = TextEditingController();
  TextEditingController utsController = TextEditingController();
  TextEditingController uasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Nilai'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: tmController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nilai TR'),
            ),
            TextField(
              controller: utsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nilai UTS/Mid'),
            ),
            TextField(
              controller: uasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nilai UAS/Final'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double tr = double.tryParse(tmController.text) ?? 0.0;
                double uts = double.tryParse(utsController.text) ?? 0.0;
                double uas = double.tryParse(uasController.text) ?? 0.0;
                double average = (tr * 0.2) + (uts * 0.3) + (uas * 0.5);
                String grade = getGrade(average);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultPage(tr, uts, uas, average, grade),
                  ),
                );
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }

  String getGrade(double score) {
    if (score >= 90) {
      return 'A';
    } else if (score >= 85) {
      return 'A-';
    } else if (score >= 80) {
      return 'B+';
    } else if (score >= 75) {
      return 'B';
    } else if (score >= 70) {
      return 'B-';
    } else if (score >= 65) {
      return 'C';
    } else if (score >= 50) {
      return 'D';
    } else if (score >= 0) {
      return 'E';
    } else {
      return 'F';
    }
  }
}

class ResultPage extends StatelessWidget {
  final double tr;
  final double uts;
  final double uas;
  final double average;
  final String grade;

  ResultPage(this.tr, this.uts, this.uas, this.average, this.grade);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Perhitungan nilai'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('TR: $tr'),
            Text('UTS/Mid: $uts'),
            Text('UAS/Final: $uas'),
            Text('Final Score: $average'),
            Text('Grade: $grade'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
