// filepath: /Users/najea/HRConnectApp/lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/employee_screen.dart';
import 'screens/attendance_screen.dart';
import 'screens/leave_screen.dart';
import 'screens/performance_screen.dart';
import 'models/user_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
      ],
      child: HRConnectApp(),
    ),
  );
}

class HRConnectApp extends StatelessWidget {
  const HRConnectApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/employees': (context) => EmployeeScreen(),
        '/attendance': (context) => AttendanceScreen(),
        '/leave': (context) => LeaveScreen(),
        '/performance': (context) => PerformanceScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}