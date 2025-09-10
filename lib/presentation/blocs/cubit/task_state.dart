part of 'task_cubit.dart';

class TaskState {
  final List<TaskEntity> tasks;
  final TaskEntityStatus? filterStatus;
  final TaskEntityPriority? filterPriority;

  TaskState({required this.tasks, this.filterStatus, this.filterPriority});

  TaskState copyWith({
    List<TaskEntity>? tasks,
    TaskEntityStatus? filterStatus,
    TaskEntityPriority? filterPriority,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      filterStatus: filterStatus ?? this.filterStatus,
      filterPriority: filterPriority ?? this.filterPriority,
    );
  }

  List<TaskEntity> get filteredTasks {
    return tasks.where((t) {
      final statusMatch =
          filterStatus == null || t.status == filterStatus;
      final priorityMatch =
          filterPriority == null || t.priority == filterPriority;
      return statusMatch && priorityMatch;
    }).toList()
      ..sort((a, b) => b.priority!.index.compareTo(a.priority!.index));
  }
}

