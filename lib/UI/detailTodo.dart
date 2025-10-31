import 'package:flutter/material.dart';

import '../models/todo.dart';

class DetailTodo extends StatelessWidget {
  final Todo todo;

  const DetailTodo({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final Color baseColor = Colors.grey.shade50;

    return Scaffold(
      appBar: AppBar(title: Text('Todo ${todo.id}')),
      body: Center(
        child: Column(
          children: [
            Card(
              color: baseColor,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.key)),
                title: const Text('Identifiant'),
                subtitle: Text('${todo.id}'),
              ),
            ),
            Card(
              color: baseColor,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.title)),
                title: const Text('Titre de la tache'),
                subtitle: Text(todo.title),
              ),
            ),
            Card(
              color: baseColor,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.description)),
                title: const Text('Statut '),
                subtitle: Text(todo.completed ? 'true' :  'false'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
