enum TaskEntityStatus { todo, inProgress, done }
enum TaskEntityPriority { high, medium, low }

class TaskEntity {
  final String id;
  final String title;
  final String description;
  final TaskEntityStatus status;
  final TaskEntityPriority priority;
  final DateTime createdAt;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    this.status = TaskEntityStatus.todo,
    this.priority = TaskEntityPriority.medium,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  TaskEntity copyWith({
    String? title,
    String? description,
    TaskEntityStatus? status,
    TaskEntityPriority? priority,
  }) {
    return TaskEntity(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      createdAt: createdAt,
    );
  }
}
