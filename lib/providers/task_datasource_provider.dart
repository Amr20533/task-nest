import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_nest/data/task_datasourse.dart';

final taskDataSourceProvider = Provider<TaskDataSource>((ref) {
  return TaskDataSource();
});
