import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_nest/models/task_model.dart';
import 'package:task_nest/presentation/widgets/circular_icon.dart';
import 'package:task_nest/utils/extensions.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.onTap,
    required this.onLongPress,
    required this.task,
  });

  final TaskModel task;
  final void Function()? onLongPress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    final TextDecoration textDecoration = task.isCompleted ? TextDecoration.lineThrough :TextDecoration.none;
    final FontWeight fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;

    return Padding(
      padding: const EdgeInsets.only(
          left: 16,
          top: 10,
          bottom: 10
      ),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Row(
          children: [
            CircularIcon(task: task),
            const Gap(16),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title, style: context.textTheme.titleLarge!.copyWith(fontSize: 20,decoration: textDecoration, fontWeight: fontWeight), maxLines: 1,overflow:  TextOverflow.ellipsis,),
                  Text(task.time, style: context.textTheme.titleSmall!.copyWith(color: colors.outline, decoration: textDecoration)),
                ],
              ),
            ),
            Checkbox(
                value: task.isCompleted,
                onChanged: (value){}
            )
          ],
        ),
      ),
    );
  }
}

