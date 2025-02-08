import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${user.name}", style: TextStyle(fontSize: 18, fontFamily: 'CustomFont')),
            SizedBox(height: 10),
            Text("Email: ${user.email}", style: TextStyle(fontSize: 18, fontFamily: 'CustomFont')),
            SizedBox(height: 10),
            Text("Position: ${user.position}", style: TextStyle(fontSize: 18, fontFamily: 'CustomFont')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}