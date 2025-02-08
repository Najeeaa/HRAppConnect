import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final List<Map<String, String>> attendance = [];
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  void markAttendance() {
    if (employeeNameController.text.isNotEmpty && dateController.text.isNotEmpty) {
      setState(() {
        attendance.add({
          "name": employeeNameController.text,
          "date": dateController.text,
        });
        employeeNameController.clear();
        dateController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Attendance Management")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: employeeNameController,
              decoration: InputDecoration(labelText: "Employee Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: "Date"),
            ),
          ),
          ElevatedButton(onPressed: markAttendance, child: Text("Mark Attendance")),
          Expanded(
            child: ListView.builder(
              itemCount: attendance.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${attendance[index]["name"]}"),
                  subtitle: Text("Date: ${attendance[index]["date"]}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}