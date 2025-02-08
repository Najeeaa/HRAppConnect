import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HR Connect"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/employees');
              },
              child: Text('Employees Management'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/attendance');
              },
              child: Text('Attendance Management'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/leave');
              },
              child: Text('Leave Requests'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/performance');
              },
              child: Text('Performance Reviews'),
            ),
          ],
        ),
      ),
    );
  }
}