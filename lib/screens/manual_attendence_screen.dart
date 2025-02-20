// import 'package:flutter/material.dart';

// class ManualAttendancePage extends StatefulWidget {
//   @override
//   _ManualAttendancePageState createState() => _ManualAttendancePageState();
// }

// class _ManualAttendancePageState extends State<ManualAttendancePage> {
//   // List of students
//   List<Student> students = [
//     Student(name: 'M Salauddin', isPresent: false),
//     Student(name: 'Thuin Omer', isPresent: false),
//     Student(name: 'Shawn Khan', isPresent: false),
//     Student(name: 'Naim Islam', isPresent: false),
//     Student(name: 'Nizam Khan', isPresent: false),
//     Student(name: 'Arif Mia', isPresent: false),
//     Student(name: 'Asraful', isPresent: false),
//     Student(name: 'Farjana Akter', isPresent: false),
//     Student(name: 'Khota Khan', isPresent: false),
//     Student(name: 'Sadia Rohoman', isPresent: false),
//     Student(name: 'Md Abir', isPresent: false),
//     Student(name: 'Md Mehide', isPresent: false),
//     Student(name: 'Sojib Islam', isPresent: false),
//     Student(name: 'Rakib Matubbar', isPresent: false),
//     Student(name: 'Anower ', isPresent: false),
//     Student(name: 'Mukta Akter', isPresent: false),
//     Student(name: 'Walid', isPresent: false),
//     Student(name: 'Robiul Mia', isPresent: false),
//   ];

//   // Function to toggle attendance
//   void _toggleAttendance(int index, bool? value) {
//     setState(() {
//       students[index].isPresent = value ?? false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Manual Attendance'),
//         backgroundColor: Colors.blue,
//       ),
//       body: ListView.builder(
//         itemCount: students.length,
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 5,
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: ListTile(
//               title: Text(students[index].name),
//               trailing: Checkbox(
//                 value: students[index].isPresent,
//                 onChanged: (bool? value) {
//                   _toggleAttendance(index, value);
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Logic to save or process attendance can be added here
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text('Attendance saved!')));
//         },
//         child: Icon(Icons.save),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }
// }

// // Student class to hold student data
// class Student {
//   String name;
//   bool isPresent;

//   Student({required this.name, this.isPresent = false});
// }




import 'package:flutter/material.dart';




class ManualAttendanceScreenF extends StatefulWidget { @override _FilterScreenState createState() => _FilterScreenState(); }

class _FilterScreenState extends State<ManualAttendanceScreenF> { String selectedClass = 'All'; String selectedSubject = 'All'; DateTime selectedDate = DateTime.now();

@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar(title: Text('Filter Attendance')), body: Padding( padding: EdgeInsets.all(20), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text('Select Class', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), SizedBox(height: 10), DropdownButtonFormField<String>( value: selectedClass, onChanged: (value) { setState(() { selectedClass = value!; }); }, items: ['All', '9', '10'] .map((e) => DropdownMenuItem(value: e, child: Text('Class $e'))) .toList(), decoration: InputDecoration( border: OutlineInputBorder(), filled: true, fillColor: Colors.white, ), ), SizedBox(height: 20), Text('Select Subject', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), SizedBox(height: 10), DropdownButtonFormField<String>( value: selectedSubject, onChanged: (value) { setState(() { selectedSubject = value!; }); }, items: ['All', 'Math', 'Science'] .map((e) => DropdownMenuItem(value: e, child: Text(e))) .toList(), decoration: InputDecoration( border: OutlineInputBorder(), filled: true, fillColor: Colors.white, ), ), SizedBox(height: 20), Text('Select Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), SizedBox(height: 10), ElevatedButton( onPressed: () async { DateTime? pickedDate = await showDatePicker( context: context, initialDate: selectedDate, firstDate: DateTime(2020), lastDate: DateTime(2030), ); if (pickedDate != null && pickedDate != selectedDate) { setState(() { selectedDate = pickedDate; }); } }, child: Text('${selectedDate.toLocal()}'.split(' ')[0]), ), SizedBox(height: 30), Center( child: ElevatedButton( onPressed: () { Navigator.push( context, MaterialPageRoute( builder: (context) => ManualAttendanceScreen(selectedClass: selectedClass, selectedSubject: selectedSubject, selectedDate: selectedDate), ), ); }, child: Text('Take Attendance'), style: ElevatedButton.styleFrom( padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), textStyle: TextStyle(fontSize: 18), ), ), ), ], ), ), ); } }

class ManualAttendanceScreen extends StatefulWidget { final String selectedClass; final String selectedSubject; final DateTime selectedDate;

ManualAttendanceScreen({required this.selectedClass, required this.selectedSubject, required this.selectedDate});

@override _ManualAttendanceScreenState createState() => _ManualAttendanceScreenState(); }

class _ManualAttendanceScreenState extends State<ManualAttendanceScreen> { final List<Map<String, dynamic>> students = [ {'name': 'Rahim', 'present': false}, {'name': 'Karim', 'present': false}, {'name': 'Jamil', 'present': false}, {'name': 'Sami', 'present': false}, ];

@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar(title: Text('Manual Attendance')), body: ListView.builder( padding: EdgeInsets.all(10), itemCount: students.length, itemBuilder: (context, index) { final student = students[index]; return Card( margin: EdgeInsets.symmetric(vertical: 10), child: ListTile( contentPadding: EdgeInsets.all(15), title: Text(student['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), trailing: Checkbox( value: student['present'], onChanged: (bool? value) { setState(() { student['present'] = value!; }); }, ), ), ); }, ), floatingActionButton: FloatingActionButton( onPressed: () { ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Attendance saved successfully!')), ); }, child: Icon(Icons.save), ), ); } }
