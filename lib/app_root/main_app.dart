import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/style/theme.dart';
import 'package:to_do_list_app/futers/splach/splach_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const SplachScreen(),
    );
  }
}
