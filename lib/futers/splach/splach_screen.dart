import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list_app/core/constans/app_constant.dart';
import 'package:to_do_list_app/core/style/colors.dart';
import 'package:to_do_list_app/futers/auth/data/model/user_model.dart';
import 'package:to_do_list_app/futers/auth/screen/login_screen.dart';
import 'package:to_do_list_app/futers/home/screen/home_screen.dart';

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
        MaterialPageRoute(builder: (context) => nextRuote()),
      );
    });
    super.initState();
  }

  Widget nextRuote() {
    final box = Hive.box<UserModel>(AppConstant.userBox);
    final userData = box.isNotEmpty ? box.getAt(0) : null;
    if (userData == null) {
      return LoginScreen();
    } else {
      return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tango,
      body: Center(child: Lottie.asset("assets/icons/loader_cat.json")),
    );
  }
}
