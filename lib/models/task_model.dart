import 'package:equatable/equatable.dart';
import 'package:task_nest/utils/task_categories.dart';

class TaskModel extends Equatable{
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final TaskCategories category;
  final bool isCompleted;

  const TaskModel({this.id,required this.title,required this.note,required this.time,required this.date,required this.category,required this.isCompleted,});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      title,
      note,
      time,
      date,
      isCompleted,
      category
    ];
  }

}