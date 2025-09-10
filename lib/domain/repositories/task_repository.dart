
import 'dart:convert';

import 'package:kakotel_test/core/database/local_storage.dart';
import 'package:kakotel_test/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getAllTasks();
  Future<void> addTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String id);
}
