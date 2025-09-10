import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kakotel_test/domain/entities/task_entity.dart';
import 'package:kakotel_test/domain/repositories/task_repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository repository;

  TaskCubit(this.repository) : super(TaskState(tasks: [])) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    final tasks = await repository.getAllTasks();
    emit(state.copyWith(tasks: tasks));
  }

  Future<void> addTask(TaskEntity task) async {
    await repository.addTask(task);
    emit(state.copyWith(tasks: [...state.tasks, task]));
  }

  Future<void> updateTask(TaskEntity task) async {
    await repository.updateTask(task);
    final updatedTasks = state.tasks.map((t) => t.id == task.id ? task : t).toList();
    emit(state.copyWith(tasks: updatedTasks));
  }

  Future<void> deleteTask(String id) async {
    await repository.deleteTask(id);
    final updatedTasks = state.tasks.where((t) => t.id != id).toList();
    emit(state.copyWith(tasks: updatedTasks));
  }

  void filter({TaskEntityStatus? status, TaskEntityPriority? priority}) {
    emit(state.copyWith(filterStatus: status, filterPriority: priority));
  }
}
