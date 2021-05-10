import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoController = TextEditingController();
  List<String> todolist = [];
  Widget getTodos(List<String> todos) {
    List<Widget> todoContainer = todos.map((todo) {
      return Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                todo,
                textAlign: TextAlign.center,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    todos.remove(todo);
                  });
                },
              ),
            ],
          ));
    }).toList();

    return Column(
      children: todoContainer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Toodle"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          TextField(
            controller: todoController,
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {
              print(todoController.text);
              if (todoController.text.isNotEmpty &&
                  todoController.text != null) {
                setState(() {
                  todolist.add(todoController.text);
                  todoController.clear();
                });
              }
            },
            child: Text("Add Todo"),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          getTodos(todolist)
        ],
      ),
    );
  }
}
