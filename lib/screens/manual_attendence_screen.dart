import 'package:flutter/material.dart';

class ManualAttendancePage extends StatefulWidget {
  @override
  _ManualAttendancePageState createState() => _ManualAttendancePageState();
}

class _ManualAttendancePageState extends State<ManualAttendancePage> {
  // List of students
  List<Student> students = [
    Student(name: 'M Salauddin', isPresent: false),
    Student(name: 'Thuin Omer', isPresent: false),
    Student(name: 'Shawn Khan', isPresent: false),
    Student(name: 'Naim Islam', isPresent: false),
    Student(name: 'Nizam Khan', isPresent: false),
    Student(name: 'Arif Mia', isPresent: false),
    Student(name: 'Asraful', isPresent: false),
    Student(name: 'Farjana Akter', isPresent: false),
    Student(name: 'Khota Khan', isPresent: false),
    Student(name: 'Sadia Rohoman', isPresent: false),
    Student(name: 'Md Abir', isPresent: false),
    Student(name: 'Md Mehide', isPresent: false),
    Student(name: 'Sojib Islam', isPresent: false),
    Student(name: 'Rakib Matubbar', isPresent: false),
    Student(name: 'Anower ', isPresent: false),
    Student(name: 'Mukta Akter', isPresent: false),
    Student(name: 'Walid', isPresent: false),
    Student(name: 'Robiul Mia', isPresent: false),
  ];

  // Function to toggle attendance
  void _toggleAttendance(int index, bool? value) {
    setState(() {
      students[index].isPresent = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual Attendance'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(students[index].name),
              trailing: Checkbox(
                value: students[index].isPresent,
                onChanged: (bool? value) {
                  _toggleAttendance(index, value);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic to save or process attendance can be added here
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Attendance saved!')));
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.green,
      ),
    );
  }
}

// Student class to hold student data
class Student {
  String name;
  bool isPresent;

  Student({required this.name, this.isPresent = false});
}
