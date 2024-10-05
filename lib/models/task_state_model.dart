import 'package:equatable/equatable.dart';
import 'package:task_nest/models/task_model.dart';

class TaskStateModel extends Equatable{
  final List<TaskModel> tasks;

  const TaskStateModel(this.tasks);

  const TaskStateModel.initial({this.tasks = const []});

  TaskStateModel copyWith({
    List<TaskModel>? tasks,
}) => TaskStateModel(
    tasks ?? this.tasks,
  );

  @override
  List<Object?> get props => [tasks];



}