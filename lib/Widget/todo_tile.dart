import 'package:database/Screens/edit_page.dart';
import 'package:database/model/todo_model.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {

  final String name;
  final String section;
  final int id;
  final Function delete;
  final Function edit;

  const TodoTile({
    required this.name,
    required this.section,
    required this.id,
    required this.delete,
    required this.edit,
    Key? key
  }) : super(key: key);

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {

  int listNumber = 0;

  @override
  Widget build(BuildContext context) {

    var anotherTodo = TodoModel(
        id: widget.id,
        name: widget.name,
        section: widget.section
    );



    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Card(
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3)
            )
          ),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.black,
                  width: 5
                )
              )
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Text(
                    widget.id.toString(),
                    style: const TextStyle(
                      color: Colors.black
                    ),
                  ),
                ),
              ),
              title: Text(
                widget.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              subtitle: Text(
                widget.section,
                style: const TextStyle(
                  fontStyle: FontStyle.italic
                ),
              ),
              trailing: FittedBox(
                fit: BoxFit.fill,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditPage(
                              id: widget.id,
                              name: widget.name,
                              section: widget.section,
                              edit: widget.edit
                            )
                          )
                        );
                      },
                      icon: const Icon(
                        Icons.mode_edit_outline_sharp,
                        color: Colors.black,
                      )
                  ),
                    IconButton(
                      onPressed: (){
                       widget.delete(anotherTodo);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      )
                    ),
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
