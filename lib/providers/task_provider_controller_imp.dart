import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_nest/models/task_state_model.dart';
import 'package:task_nest/providers/task_provider.dart';
import 'package:task_nest/providers/tast_repository_provider.dart';

final taskControllerProviderImp = StateNotifierProvider<TaskControllerProvider, TaskStateModel>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskControllerProvider(repository);
});
