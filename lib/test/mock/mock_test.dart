import 'package:flutter_test/flutter_test.dart';
import 'package:kakotel_test/domain/entities/task_entity.dart';
import 'package:kakotel_test/domain/repositories/task_repository.dart';
import 'package:kakotel_test/presentation/blocs/cubit/task_cubit.dart';

// Mock de TaskRepository pour les tests unitaires
class MockRepository implements TaskRepository {
  final List<TaskEntity> _tasks = [];

  @override
  Future<void> addTask(TaskEntity task) async => _tasks.add(task);

  @override
  Future<void> deleteTask(String id) async =>
      _tasks.removeWhere((t) => t.id == id);

  @override
  Future<List<TaskEntity>> getAllTasks() async => List.from(_tasks);

  @override
  Future<void> updateTask(TaskEntity task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) _tasks[index] = task;
  }
}

void main() {
  group('TaskCubit tests', () {
    late TaskCubit cubit;
    late MockRepository repository;

    setUp(() {
      repository = MockRepository();
      cubit = TaskCubit(repository);
    });

    test('Ajouter et filtrer des tâches', () async {
      final task1 = TaskEntity(id: "1", title: "Tâche 1", description: "");
      final task2 = TaskEntity(
        id: "2",
        title: "Tâche 2",
        description: "",
        status: TaskEntityStatus.done,
      );

      await cubit.addTask(task1);
      await cubit.addTask(task2);

      // Vérification que toutes les tâches ont été ajoutées
      expect(cubit.state.tasks.length, 2);

      // Appliquer le filtre sur le statut "done"
      cubit.filter(status: TaskEntityStatus.done);

      // Vérifier que le filtrage fonctionne correctement
      expect(cubit.state.filteredTasks.length, 1);
      expect(cubit.state.filteredTasks.first.id, "2");
    });

    test('Mettre à jour une tâche', () async {
      final task = TaskEntity(id: "1", title: "Initial", description: "");
      await cubit.addTask(task);

      final updatedTask = task.copyWith(
        title: "Modifiée",
        status: TaskEntityStatus.inProgress,
      );
      await cubit.updateTask(updatedTask);

      final stateTask = cubit.state.tasks.first;
      expect(stateTask.title, "Modifiée");
      expect(stateTask.status, TaskEntityStatus.inProgress);
    });

    test('Supprimer une tâche', () async {
      final task = TaskEntity(id: "1", title: "À supprimer", description: "");
      await cubit.addTask(task);

      await cubit.deleteTask("1");

      expect(cubit.state.tasks.isEmpty, true);
    });
  });
}
