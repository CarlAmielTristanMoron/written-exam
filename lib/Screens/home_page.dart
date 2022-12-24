import 'package:database/Screens/form_page.dart';
import 'package:database/Widget/todo_list.dart';
import 'package:database/model/db_model.dart';
import 'package:database/model/todo_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var db = DatabaseConnect();

  //Add Function
  void addStudent(TodoModel todo) async {
    await db.insertTodo(todo);
    setState(() {

    });
  }

  //Delete Function
  void deleteStudent(TodoModel todo) async {
    await db.deleteTodo(todo);
    setState(() {

    });
  }

  //Edit Function
  void editStudent(TodoModel todo) async {
    await db.editTodo(todo);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Student List',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TodoList(
              delete: deleteStudent,
              edit: editStudent,
            )
          ],
        )
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: 200,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormPage(insert: addStudent)
                )
            );
          },
          child: const Text('Add Student'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
