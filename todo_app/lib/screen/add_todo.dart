import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTitle = TextEditingController();
    TextEditingController controllerDesc = TextEditingController();

    AppBar myAppbar = AppBar(
      title: const Text("Add Todo"),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

    double heightBody = MediaQuery.of(context).size.height -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    double widthBody = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: myAppbar,
      body: Container(
        width: widthBody,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white12,
              ),
              child: TextField(
                controller: controllerTitle,
                maxLength: 20,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  hintText: 'Title',
                  border: InputBorder.none, //07:08
                ),
              ),
            ),
            SizedBox(height: heightBody * 0.05),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white12,
              ),
              child: TextField(
                controller: controllerDesc,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  border: InputBorder.none, //07:08
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controllerTitle.text.isNotEmpty ||
              controllerDesc.text.isNotEmpty) {
            dataTodo.add(
              Todo(
                id: DateTime.now().toString(),
                title: controllerTitle.text.isEmpty
                    ? "No Title"
                    : controllerTitle.text,
                desc: controllerDesc.text.isEmpty
                    ? "No Descrip"
                    : controllerDesc.text,
              ),
            );
          }

          print(dataTodo);
          Navigator.pop(context);
        },
        child: const Icon(Icons.add_task),
      ),
    );
  }
}
