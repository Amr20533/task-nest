import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:task_nest/models/task_model.dart';
import 'package:task_nest/presentation/widgets/circular_icon.dart';
import 'package:task_nest/presentation/widgets/task_tile.dart';
import 'package:task_nest/utils/extensions.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.tasks, this.isComplete = false});

  final List<TaskModel> tasks;
  final bool isComplete;
  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final height = isComplete ? deviceSize.height * 0.25 : deviceSize.height * 0.31;
    final emptyTaskMessage = isComplete ? 'There\'s no completed tasks yet!' : 'There\'s no tasks todo!';

    return Container(
      width: deviceSize.width,
      height: height,
      decoration: BoxDecoration(
          color: colors.primaryContainer,
          borderRadius: BorderRadius.circular(10)
      ),
        child: tasks.isEmpty ? Center(child: Text(emptyTaskMessage, style: context.textTheme.titleLarge,))
            :
        ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return TaskTile(
                  onTap: () async {
                    await _showTaskDetails(context, task: task);
                  },
                  onLongPress: (){

                  },
                  task: task
              );
            },
    separatorBuilder: (context, index) => const Divider(thickness: 1.5,)
    )
    );
  }

  Future<dynamic> _showTaskDetails(BuildContext context, {required TaskModel task}) async {
    return await showModalBottomSheet(context: context,
        builder: (context) {
          final colors = context.colorScheme;
          final deviceSize = context.deviceSize;

          final TextDecoration textDecoration = task.isCompleted ? TextDecoration.lineThrough :TextDecoration.none;
          final FontWeight fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;

          return Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              CircularIcon(task: task),
              const Gap(15),
              Text(task.title, style: context.textTheme.titleLarge!.copyWith(fontSize: 20,decoration: textDecoration, fontWeight: fontWeight), maxLines: 1,overflow:  TextOverflow.ellipsis,),
              const Gap(5),
              Text(task.time, style: context.textTheme.titleSmall!.copyWith(color: colors.outline, decoration: textDecoration)),

              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 15),
                child: Divider(thickness: 1.5, color: task.category.color,),
              ),
              Visibility(
                visible: !task.isCompleted,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Task to be completed on ${DateFormat('MMM d').format(DateTime.parse(task.date))}", style: context.textTheme.titleSmall,),
                  const Gap(5),
                  Icon(Icons.check_box,
                    color: task.category.color,
                    size: 20,
                  ),
                ],
              )),
              const Gap(15),
              Container(
                  width: deviceSize.width,
                  child: Text(task.note.isEmpty ? 'There\'s no additional note for this task!' : task.note, style: context.textTheme.titleMedium, textAlign: TextAlign.center,)),
              const Gap(15),
              Visibility(
                  visible: task.isCompleted,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Task completed!", style: context.textTheme.titleSmall,),
                      const Gap(5),
                      Icon(Icons.check_box,
                        color: task.category.color,
                        size: 20,
                      ),
                    ],
                  )),

            ],
          ),
        );
        });
  }
}

