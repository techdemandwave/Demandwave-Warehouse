import 'package:dw_warehouse/screen/tasks_screen.dart';
import 'package:dw_warehouse/utils/colors.dart';
import 'package:dw_warehouse/widgets/custom_screen_related.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String route = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Home', context: context, showBackButton: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _taskCards(
                text: 'Pending Task',
                count: 10,
                onClick: () {
                  Navigator.pushNamed(context, TasksScreen.route);
                },
              ),
              _taskCards(
                text: 'Completed Task',
                count: 20,
                onClick: () {
                  print('Clicked completed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _taskCards({
    required String text,
    required int count,
    required Function() onClick,
  }) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 2),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: AppColors.getMaterialColorFromColor(AppColors.blue).shade500,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appText(text),
            appText('$count', fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}
