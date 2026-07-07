import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list_app/core/style/colors.dart';
import 'package:to_do_list_app/futers/auth/screen/login_screen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tango,
      body: Center(child: Lottie.asset("assets/icons/loader_cat.json")),
    );
  }
}
