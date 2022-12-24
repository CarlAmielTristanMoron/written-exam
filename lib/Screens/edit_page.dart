import 'package:flutter/material.dart';
import '../model/todo_model.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    required this.id,
    required this.name,
    required this.section,
    required this.edit,
    Key? key
  }) : super(key: key);

  final int id;
  final String name;
  final String section;
  final Function edit;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  var editFormKey = GlobalKey<FormState>();
  TextEditingController editNameController = TextEditingController();
  TextEditingController editSectionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Page'),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: editFormKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                controller: editNameController,
                keyboardType: TextInputType.name,
                decoration:  InputDecoration(
                  labelText: 'Name',
                  labelStyle: const TextStyle(
                    color: Colors.black
                  ),
                  hintText: widget.name,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(200)
                    ),
                  ),
                ),
                validator: (value){
                  return value == null || value.isEmpty ? ' Please Enter Your Name!' : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                controller: editSectionController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Section',
                    labelStyle: const TextStyle(
                        color: Colors.black
                    ),
                  hintText: widget.section,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(200)
                    ),
                  )
                ),
                validator: (value){
                  return value == null || value.isEmpty ? 'Please Enter Your Section!' : null;
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black
              ),
              onPressed: (){
                if(editFormKey.currentState!.validate()){
                  var thisTodo = TodoModel(
                    id: widget.id,
                    name: editNameController.text,
                    section: editSectionController.text
                  );
                widget.edit(thisTodo);
                Navigator.pop(context);
                }
              },
              child: const Text('Confirm')
            )
          ],
        ),
      ),
    );
  }
}
