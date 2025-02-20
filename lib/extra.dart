import 'package:flutter/material.dart';



class FilterScreen extends StatefulWidget { @override _FilterScreenState createState() => _FilterScreenState(); }

class _FilterScreenState extends State<FilterScreen> { String selectedClass = 'All'; String selectedSubject = 'All';

@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar(title: Text('Filter Attendance')), body: Padding( padding: EdgeInsets.all(20), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text('Select Class', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), SizedBox(height: 10), DropdownButtonFormField<String>( value: selectedClass, onChanged: (value) { setState(() { selectedClass = value!; }); }, items: ['All', '9', '10'] .map((e) => DropdownMenuItem(value: e, child: Text('Class $e'))) .toList(), decoration: InputDecoration( border: OutlineInputBorder(), filled: true, fillColor: Colors.white, ), ), SizedBox(height: 20), Text('Select Subject', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), SizedBox(height: 10), DropdownButtonFormField<String>( value: selectedSubject, onChanged: (value) { setState(() { selectedSubject = value!; }); }, items: ['All', 'Math', 'Science'] .map((e) => DropdownMenuItem(value: e, child: Text(e))) .toList(), decoration: InputDecoration( border: OutlineInputBorder(), filled: true, fillColor: Colors.white, ), ), SizedBox(height: 30), Center( child: ElevatedButton( onPressed: () { Navigator.push( context, MaterialPageRoute( builder: (context) => AttendanceScreen(selectedClass: selectedClass, selectedSubject: selectedSubject), ), ); }, child: Text('View Attendance'), style: ElevatedButton.styleFrom( padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), textStyle: TextStyle(fontSize: 18), ), ), ), ], ), ), ); } }

class AttendanceScreen extends StatelessWidget { final String selectedClass; final String selectedSubject;

AttendanceScreen({required this.selectedClass, required this.selectedSubject});

final List<Map<String, dynamic>> students = [ {'name': 'Rahim', 'attendance': 85, 'class': '10', 'subject': 'Math'}, {'name': 'Karim', 'attendance': 70, 'class': '10', 'subject': 'Science'}, {'name': 'Jamil', 'attendance': 90, 'class': '9', 'subject': 'Math'}, {'name': 'Sami', 'attendance': 60, 'class': '9', 'subject': 'Science'}, ];

@override Widget build(BuildContext context) { List<Map<String, dynamic>> filteredStudents = students.where((student) { return (selectedClass == 'All' || student['class'] == selectedClass) && (selectedSubject == 'All' || student['subject'] == selectedSubject); }).toList();

return Scaffold(
  appBar: AppBar(title: Text('Student Attendance')),
  body: ListView.builder(
    padding: EdgeInsets.all(10),
    itemCount: filteredStudents.length,
    itemBuilder: (context, index) {
      final student = filteredStudents[index];
      return Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          contentPadding: EdgeInsets.all(15),
          leading: CircularAttendanceIndicator(attendance: student['attendance']),
          title: Text(student['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          subtitle: Text('Class: ${student['class']} | Subject: ${student['subject']}\nAttendance: ${student['attendance']}%'),
        ),
      );
    },
  ),
);

} }

class CircularAttendanceIndicator extends StatelessWidget { final int attendance;

CircularAttendanceIndicator({required this.attendance});

@override Widget build(BuildContext context) { return SizedBox( width: 50, height: 50, child: Stack( fit: StackFit.expand, children: [ CircularProgressIndicator( value: attendance / 100, backgroundColor: Colors.grey.shade300, valueColor: AlwaysStoppedAnimation<Color>(_getColor(attendance)), strokeWidth: 6, ), Center( child: Text('$attendance%', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)), ), ], ), ); }

Color _getColor(int attendance) { if (attendance >= 80) { return Colors.green; } else if (attendance >= 60) { return Colors.orange; } else { return Colors.red; } } }