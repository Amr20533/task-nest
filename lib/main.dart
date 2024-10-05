import 'package:flutter/material.dart';
import 'package:task_nest/config/theme/app_theme.dart';
import 'package:task_nest/presentation/views/home_page.dart';
import 'package:task_nest/services/notifications/notification_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Nest',
      theme: AppTheme.light,
      home: HomePage(),
    );
  }
}

