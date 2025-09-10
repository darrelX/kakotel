import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakotel_test/domain/entities/task_entity.dart';
import 'package:kakotel_test/domain/repositories/task_repository.dart';
import 'package:kakotel_test/presentation/blocs/cubit/task_cubit.dart';


@RoutePage()
class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskCubit(TaskRepository()),
      child: Scaffold(
        appBar: AppBar(title: Text("Gestionnaire de tâches")),
        body: Column(
          children: [
            // Filtres (ex: Dropdown)
            FilterWidget(),
            Expanded(
              child: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  final tasks = state.filteredTasks;
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (_, index) {
                      final task = tasks[index];
                      return ListTile(
                        title: Text(task.title ?? "Inconnu"),
                        subtitle: Text("${task.priority?.name} - ${task.status?.name}"),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<TaskEntityStatus>(
          hint: Text("Statut"),
          items: TaskEntityStatus.values
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
          onChanged: (value) => context.read<TaskCubit>().filter(status: value),
        ),
        DropdownButton<TaskEntityPriority>(
          hint: Text("Priorité"),
          items: TaskEntityPriority.values
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
          onChanged: (value) => context.read<TaskCubit>().filter(priority: value),
        ),
      ],
    );
  }
}
