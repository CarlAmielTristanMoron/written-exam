import 'package:database/Widget/todo_tile.dart';
import 'package:database/model/db_model.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList({
    required this.delete,
    required this.edit,
    Key? key
  }) : super(key: key);

  final Function delete;
  final Function edit;

  var db = DatabaseConnect();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
          future: db.getTodo(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot<List> snapshot){
            var data = snapshot.data;
            var dataLength = data!.length;

            return dataLength == 0 ? const Center(
              child: Text('No Data Found')
            ) : ListView.builder(
              itemCount: dataLength,
              itemBuilder: (context, index) => TodoTile(
                id: data[index].id,
                name: data[index].name,
                section: data[index].section,
                delete: delete,
                edit: edit,
              )
            );
          }
        )
    );
  }
}
