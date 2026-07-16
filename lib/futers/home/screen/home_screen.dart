import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/style/colors.dart';
import 'package:to_do_list_app/core/style/text_style.dart';
import 'package:to_do_list_app/futers/home/widgets/home_app_bar.dart';
import 'package:to_do_list_app/futers/home/widgets/stats_card.dart';
import 'package:to_do_list_app/futers/home/widgets/task_item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFFCE93D8), // Soft Lavender
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add New Task',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              const SizedBox(height: 24),
              const StatsCard(),
              const SizedBox(height: 32),
              Text(
                'Todays Tasks',
                style: TextStyles.title2.copyWith(
                  color: AppColors.charcoalGrey,
                ),
              ),
              const SizedBox(height: 24),
              ListTasks(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTasks extends StatelessWidget {
  const ListTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const TaskItemCard(),
        separatorBuilder: (context, index) => const SizedBox(height: 29),
        itemCount: 17,
      ),
    );
  }
}
