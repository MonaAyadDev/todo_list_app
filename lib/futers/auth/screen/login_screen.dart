import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_list_app/core/style/colors.dart';
import 'package:to_do_list_app/core/style/text_style.dart';
import 'package:to_do_list_app/core/widgets/coustom__form_filde.dart';
import 'package:to_do_list_app/core/widgets/main_button.dart';
import 'dart:io';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final picker = ImagePicker();
  XFile? image;

  Future<void> pickFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        image = pickedFile;
      });
    }
  }

  Future<void> pickFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = pickedFile;
      });
    }
  }

  void showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Choose"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  pickFromCamera();
                },
                icon: Icon(Icons.camera),
              ), // IconButton - camera

              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  pickFromGallery();
                },
                icon: Icon(Icons.browse_gallery),
              ), // IconButton - gallery
            ],
          ), // Column
        ); // AlertDialog
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: showImageSourceDialog,

              child: CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.primary.withAlpha(80),
                backgroundImage: image != null
                    ? FileImage(File(image!.path))
                    : null,
                child: image == null ? Icon(Icons.person, size: 60) : null,
              ),
            ),
            SizedBox(height: 35),
            Text('Creat Your Profile', style: TextStyles.title2),
            SizedBox(height: 20),
            Text(
              'Add Your Email And pofile picture',
              style: TextStyles.caption2,
            ),
            SizedBox(height: 25),

            CoustomFormFilde(label: 'Full Name :', hint: 'enter your email'),
            SizedBox(height: 40),

            MainButton(text: 'Continue', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
