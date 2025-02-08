import 'package:flutter/material.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  _LeaveScreenState createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  final List<Map<String, String>> leaveRequests = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String selectedLeaveType = "Annual Leave";
  final List<String> leaveTypes = ["Annual Leave", "Sick Leave", "Emergency Leave"];

  void requestLeave() {
    if (nameController.text.isNotEmpty && dateController.text.isNotEmpty) {
      setState(() {
        leaveRequests.add({
          "name": nameController.text,
          "date": dateController.text,
          "type": selectedLeaveType,
          "status": "Pending"
        });
        nameController.clear();
        dateController.clear();
      });
    }
  }

  void approveLeave(int index) {
    setState(() {
      leaveRequests[index]["status"] = "Approved";
    });
  }

  void rejectLeave(int index) {
    setState(() {
      leaveRequests[index]["status"] = "Rejected";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leave Requests")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Employee Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: "Leave Date"),
            ),
          ),
          DropdownButton<String>(
            value: selectedLeaveType,
            items: leaveTypes.map((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedLeaveType = newValue!;
              });
            },
          ),
          ElevatedButton(onPressed: requestLeave, child: Text("Request Leave")),
          Expanded(
            child: ListView.builder(
              itemCount: leaveRequests.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${leaveRequests[index]["name"]} - ${leaveRequests[index]["type"]}"),
                  subtitle: Text("Date: ${leaveRequests[index]["date"]} | Status: ${leaveRequests[index]["status"]}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.check, color: Colors.green),
                        onPressed: () => approveLeave(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.red),
                        onPressed: () => rejectLeave(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}