import 'package:task_nest/data/task_datasourse.dart';
import 'package:task_nest/models/task_model.dart';
import 'package:task_nest/repositories/task_repository.dart';

class TaskRepositoryImp implements TaskRepository{
  final TaskDataSource _instance;

  TaskRepositoryImp(this._instance);

  @override
  Future<void> createTask(TaskModel task) async{
    try{
      await _instance.addTask(task);
    }catch(error){
      throw '$error';
    }
  }

  @override
  Future<void> deleteTask(TaskModel task) async{
    try{
      await _instance.deleteTask(task);
    }catch(error){
      throw '$error';
    }
  }

  @override
  Future<List<TaskModel>> getTasks() async{
    try{
      return await _instance.getAllTasks();
    }catch(error){
      throw '$error';
    }
  }

  @override
  Future<void> updateTask(TaskModel task) async{
    try{
      await _instance.updateTask(task);
    }catch(error){
      throw '$error';
    }
  }
}