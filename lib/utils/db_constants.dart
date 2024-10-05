import 'package:task_nest/utils/tasks_constants.dart';

class DBConstants{
  DBConstants._();

  static const String taskDBName = "task.db";
  static const String taskDBTable = "tasks";
  static const String idColumn = TasksConstants.id;
  static const String titleColumn = TasksConstants.title;
  static const String noteColumn = TasksConstants.note;
  static const String timeColumn = TasksConstants.time;
  static const String dateColumn = TasksConstants.date;
  static const String categoryColumn = TasksConstants.category;
  static const String isCompletedColumn = TasksConstants.isCompleted;
}