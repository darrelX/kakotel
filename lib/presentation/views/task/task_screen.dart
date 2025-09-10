import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


@RoutePage()
class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskCubit(HiveTaskRepository()),
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
                        title: Text(task.title),
                        subtitle: Text("${task.priority.name} - ${task.status.name}"),
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
        DropdownButton<TaskStatus>(
          hint: Text("Statut"),
          items: TaskStatus.values
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
          onChanged: (value) => context.read<TaskCubit>().filter(status: value),
        ),
        DropdownButton<TaskPriority>(
          hint: Text("Priorité"),
          items: TaskPriority.values
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
          onChanged: (value) => context.read<TaskCubit>().filter(priority: value),
        ),
      ],
    );
  }
}
