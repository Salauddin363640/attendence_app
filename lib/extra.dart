import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Attendance App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/attendance_percentage': (context) => AttendancePercentagePage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Attendance'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/attendance_percentage');
          },
          child: Text('Go to Attendance Percentage'),
        ),
      ),
    );
  }
}

class AttendancePercentagePage extends StatefulWidget {
  @override
  _AttendancePercentagePageState createState() =>
      _AttendancePercentagePageState();
}

class _AttendancePercentagePageState extends State<AttendancePercentagePage> {
  String? selectedBatch;
  String? selectedSubject;
  List<String> batches = ['Batch A', 'Batch B', 'Batch C'];
  List<String> subjects = ['Math', 'Science', 'History'];

  List<Student> students = [
    Student(name: 'Alice', attendance: 85),
    Student(name: 'Bob', attendance: 92),
    Student(name: 'Charlie', attendance: 78),
    Student(name: 'David', attendance: 90),
    Student(name: 'Eve', attendance: 95),
  ];

  // Filtered list based on the selected batch and subject
  List<Student> getFilteredStudents() {
    return students; // In a real app, apply batch and subject filters here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Percentage'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter by Batch
            DropdownButton<String>(
              hint: Text('Select Batch'),
              value: selectedBatch,
              onChanged: (newValue) {
                setState(() {
                  selectedBatch = newValue;
                });
              },
              items: batches.map((batch) {
                return DropdownMenuItem<String>(
                  value: batch,
                  child: Text(batch),
                );
              }).toList(),
            ),
            SizedBox(height: 10),

            // Filter by Subject
            DropdownButton<String>(
              hint: Text('Select Subject'),
              value: selectedSubject,
              onChanged: (newValue) {
                setState(() {
                  selectedSubject = newValue;
                });
              },
              items: subjects.map((subject) {
                return DropdownMenuItem<String>(
                  value: subject,
                  child: Text(subject),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Show the attendance percentage list
            Expanded(
              child: ListView.builder(
                itemCount: getFilteredStudents().length,
                itemBuilder: (context, index) {
                  var student = getFilteredStudents()[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(student.name),
                      trailing: Text('${student.attendance}%'),
                    ),
                  );
                },
              ),
            ),

            // Attendance Graph (BarChart)
            SizedBox(height: 20),
            Text('Attendance Percentage Graph'),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  barGroups: getFilteredStudents().map((student) {
                    return BarChartGroupData(
                      x: getFilteredStudents().indexOf(student),
                      barRods: [
                        BarChartRodData(
                          y: student.attendance.toDouble(),  // Attendance as Y-axis value
                          colors: [Colors.blue],  // Bar color
                          width: 22,  // Bar width
                          borderRadius: BorderRadius.zero,  // Border radius for bars
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Student class to hold student data
class Student {
  String name;
  double attendance;

  Student({required this.name, required this.attendance});
}
