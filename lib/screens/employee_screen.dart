import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final List<Map<String, String>> employees = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();

  void addEmployee() {
    if (nameController.text.isNotEmpty && positionController.text.isNotEmpty) {
      setState(() {
        employees.add({
          "name": nameController.text,
          "position": positionController.text,
        });
        nameController.clear();
        positionController.clear();
      });
    }
  }

  void deleteEmployee(int index) {
    setState(() {
      employees.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee Management")),
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
              controller: positionController,
              decoration: InputDecoration(labelText: "Position"),
            ),
          ),
          ElevatedButton(onPressed: addEmployee, child: Text("Add Employee")),
          Expanded(
            child: ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${employees[index]["name"]}"),
                  subtitle: Text("${employees[index]["position"]}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteEmployee(index),
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