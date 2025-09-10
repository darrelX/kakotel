// import 'package:flutter_test/flutter_test.dart';
// import '../lib/application/task_cubit.dart';
// import '../lib/domain/task.dart';
// import '../lib/data/task_repository.dart';

// class MockRepository implements TaskRepository {
//   final List<Task> _tasks = [];

//   @override
//   Future<void> addTask(Task task) async => _tasks.add(task);
//   @override
//   Future<void> deleteTask(String id) async => _tasks.removeWhere((t) => t.id == id);
//   @override
//   Future<List<Task>> getAllTasks() async => _tasks;
//   @override
//   Future<void> updateTask(Task task) async {
//     final index = _tasks.indexWhere((t) => t.id == task.id);
//     if (index != -1) _tasks[index] = task;
//   }
// }

// void main() {
//   test('Ajouter et filtrer des tâches', () async {
//     final cubit = TaskCubit(MockRepository());
//     final task1 = Task(id: "1", title: "Tâche 1", description: "");
//     final task2 = Task(id: "2", title: "Tâche 2", description: "", status: TaskStatus.done);

//     await cubit.addTask(task1);
//     await cubit.addTask(task2);

//     cubit.filter(status: TaskStatus.done);
//     expect(cubit.state.filteredTasks.length, 1);
//     expect(cubit.state.filteredTasks.first.id, "2");
//   });
// }
