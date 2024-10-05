import 'package:task_nest/models/task_model.dart';

abstract class TaskRepository{
  Future<void> createTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(TaskModel task);
  Future<List<TaskModel>> getTasks();
}