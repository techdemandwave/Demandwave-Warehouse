import 'package:dw_warehouse/screen/inwarding_screen.dart';
import 'package:dw_warehouse/widgets/custom_screen_related.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});
  static String route = '/tasks';
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Tasks', context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _taskCards(
                text: 'Inwarding',
                count: 10,
                onClick: () {
                  Navigator.pushNamed(context, InwardingScreen.route);
                },
              ),
              _taskCards(
                text: 'Order picking and packing',
                count: 20,
                onClick: () {
                  print('Clicked completed');
                },
              ),
              _taskCards(text: 'Delivery task', count: 10, onClick: () {}),
              _taskCards(
                text: 'Audit task',
                count: 20,
                onClick: () {
                  print('Clicked completed');
                },
              ),
              _taskCards(
                text: 'Bulk task',
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
