import 'dart:convert';

import 'package:kakotel_test/core/database/local_storage.dart';
import 'package:kakotel_test/domain/entities/task_entity.dart';
import 'package:kakotel_test/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalStorage storage;
  static const String taskKey = "tasks";

  TaskRepositoryImpl(this.storage);

  // Récupérer toutes les tâches
  @override
  Future<List<TaskEntity>> getAllTasks() async {
    final rawList = storage.getStringList(taskKey) ?? [];
    return rawList.map((jsonStr) => TaskEntity.fromJson(json.decode(jsonStr))).toList();
  }

  // Ajouter une tâche
  @override
  Future<void> addTask(TaskEntity task) async {
    final tasks = await getAllTasks();
    tasks.add(task);
    await _saveTasks(tasks);
  }

  // Mettre à jour une tâche
  @override
  Future<void> updateTask(TaskEntity task) async {
    final tasks = await getAllTasks();
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index] = task;
      await _saveTasks(tasks);
    }
  }

  // Supprimer une tâche
  @override
  Future<void> deleteTask(String id) async {
    final tasks = await getAllTasks();
    tasks.removeWhere((t) => t.id == id);
    await _saveTasks(tasks);
  }

  // Sauvegarde interne
  Future<void> _saveTasks(List<TaskEntity> tasks) async {
    final jsonList = tasks.map((t) => json.encode(t.toJson())).toList();
    await storage.setStringList(taskKey, jsonList);
  }
}
