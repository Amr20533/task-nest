import 'package:equatable/equatable.dart';
import 'package:task_nest/utils/task_categories.dart';
import 'package:task_nest/utils/tasks_constants.dart';

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
  List<Object?> get props {
    return [
      id!,
      title,
      note,
      time,
      date,
      isCompleted,
      category
    ];
  }


  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json[TasksConstants.id],
      title: json[TasksConstants.title],
      note: json[TasksConstants.note],
      time: json[TasksConstants.time],
      date: json[TasksConstants.date],
      category: TaskCategories.stringToCategory(json[TasksConstants.category]),
      isCompleted: json[TasksConstants.isCompleted],
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TasksConstants.id: id,
      TasksConstants.title: title,
      TasksConstants.note: note,
      TasksConstants.time: time,
      TasksConstants.date: date,
      TasksConstants.category: category.name,
      TasksConstants.isCompleted: isCompleted,
    };
  }


  TaskModel copyWith ({
      int? id,
      String? title,
      String? note,
      String? time,
      String? date,
      TaskCategories? category,
      bool? isCompleted,

}){
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      time: time ?? this.time,
      date: date ?? this.date,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

}