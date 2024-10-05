import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:task_nest/models/task_model.dart';
import 'package:task_nest/models/task_state_model.dart';
import 'package:task_nest/providers/tast_repository_provider.dart';
import 'package:task_nest/repositories/task_repository.dart';

class TaskControllerProvider extends StateNotifier<TaskStateModel> {



  TaskControllerProvider(this._repository) : super(const TaskStateModel.initial()) {
    titleController = TextEditingController();
    noteController = TextEditingController();
  }


  final TaskRepository _repository;
  late final TextEditingController titleController;
  late final TextEditingController noteController;

  Future<void> createTask(TaskModel task) async{
    try{
      await _repository.createTask(task);
    }catch(error){
      debugPrint("Error While creating task to database:: $error");
    }
  }

  Future<void> deleteTask(TaskModel task) async{
    try{
      await _repository.deleteTask(task);
    }catch(error){
      debugPrint("Error While deleting task from database:: $error");
    }
  }

  Future<void> getAllTasks() async{
    try{
      final tasks = await _repository.getTasks();
      state = state.copyWith(tasks: tasks);
    }catch(error){
      debugPrint("Error While Getting tasks:: $error");
    }
  }

  Future<void> updateTask(TaskModel task) async{
    try{
      final isCompleted = !task.isCompleted;
      final updatedTask = task.copyWith(isCompleted: isCompleted);
      await _repository.updateTask(updatedTask);
    }catch(error){
      debugPrint("Error While Updating task:: $error");
    }
  }


  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }
}

