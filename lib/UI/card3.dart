import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../api/todo_api.dart';
import 'detailTodo.dart';

class Ecran3 extends StatelessWidget {
  final TodoAPI todoAPI = TodoAPI();

  Ecran3({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
      future: todoAPI.getTodos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done &&
            !snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.data != null) {
          final todos = snapshot.data!;
          
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (BuildContext context, index) {

              final todo = todos[index];
              return Card(
                color: Colors.white,
                elevation: 7,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal.shade400,
                    child: Text(todo.id.toString()),
                  ),
                  title: Text(todo.title),
                  subtitle: Text(todo.completed ? "true"  :  "false"),
                  trailing: Icon(
                    todo.completed ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: todo.completed ? Colors.green : Colors.grey,
                  ),

                  onTap: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailTodo(todo: todo),
                        ),
                      ); 
                  },   
                  
                
                ),
              );
            },
          );
        }
        return Container();
      }
    );
  }
  
}
