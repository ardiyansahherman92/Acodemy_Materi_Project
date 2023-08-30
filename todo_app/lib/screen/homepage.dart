import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = dataTodo;

  @override
  Widget build(BuildContext context) {
    AppBar myAppbar = AppBar(
      title: const Text("Todo App"),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

    double heightBody = MediaQuery.of(context).size.height -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    double widthBody = MediaQuery.of(context).size.width;

    //Function search
    void searcTodo(String query) {
      final todoFilter = dataTodo.where((todo) {
        final todoTitle = todo.title.toLowerCase();
        final input = query.toLowerCase();
        return todoTitle.contains(input);
      }).toList();

      setState(() {
        todos = todoFilter;
      });
    }

    return Scaffold(
      appBar: myAppbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: widthBody,
              height: heightBody * 0.15,
              // color: Colors.amber,
              child: TextField(
                onChanged: searcTodo,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search your task..",
                ),
              ),
            ),
            todos.isNotEmpty
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: heightBody * 0.85,
                    width: widthBody,
                    // color: Colors.amber,
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];

                        return CheckboxListTile(
                          secondary: IconButton(
                            onPressed: () {
                              todos.removeAt(index);
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            todo.title,
                            style: TextStyle(
                              fontSize: 20,
                              decoration: todo.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          subtitle: Text(todo.desc),
                          value: todo.isCompleted,
                          onChanged: (value) {
                            setState(() {
                              todo.isCompleted = value!;
                            });
                          },
                        );
                      },
                    ),
                  )
                : Container(
                    child: const Text(
                      "Data Kosong",
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_todo');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
