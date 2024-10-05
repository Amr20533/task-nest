import 'package:flutter/material.dart';
import 'package:task_nest/models/task_model.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    required this.task,

  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final double bgOpacity = task.isCompleted ? 0.1 : 0.3;
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: task.category.color.withOpacity(bgOpacity),
          border: Border.all(width: 2, color: task.category.color)
      ),
      child: Center(
        child: Icon(task.category.icon, color: task.category.color.withOpacity(iconOpacity),),
      ),

    );
  }
}
