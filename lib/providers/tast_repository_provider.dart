import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_nest/providers/task_datasource_provider.dart';
import 'package:task_nest/repositories/task_repository.dart';
import 'package:task_nest/repositories/task_repository_imp.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final instance = ref.watch(taskDataSourceProvider);
  return TaskRepositoryImp(instance);
});
