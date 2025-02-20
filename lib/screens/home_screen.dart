import 'package:attendence_app/extra.dart';
import 'package:attendence_app/screens/auto_attendence_screen.dart';
import 'package:attendence_app/screens/manual_attendence_screen.dart';
import 'package:attendence_app/screens/portfolio_screen.dart';
import 'package:attendence_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Attendance'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150', // Placeholder profile image
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Text(
                    'Student Name', // Student's name
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Auto Attendance Card
            Card(
              elevation: 5,
              child: ListTile(
                title: Text('Auto Attendance System'),
                subtitle: Text('Track attendance automatically'),
                leading: Icon(Icons.access_alarm, color: Colors.green),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AutoAttendancePage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),

            // Manual Attendance Card
            Card(
              elevation: 5,
              child: ListTile(
                title: Text('Manual Attendance'),
                subtitle: Text('Mark attendance manually'),
                leading: Icon(Icons.edit, color: Colors.blue),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ManualAttendanceScreenF(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),

            // Attendance Percentage Card
            Card(
              elevation: 5,
              child: ListTile(
                title: Text('Attendance Percentage'),
                subtitle: Text('View your attendance percentage'),
                leading: Icon(Icons.show_chart, color: Colors.orange),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FilterScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
