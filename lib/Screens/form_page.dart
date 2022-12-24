import 'package:database/model/todo_model.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({
    required this.insert,
    Key? key
  }) : super(key: key);

  final Function insert;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Form Page'),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'e.g. carl',
                  labelStyle: TextStyle(
                    color: Colors.black
                  ),
                  border: OutlineInputBorder(
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
                controller: sectionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Section',
                  hintText: 'e.g. BSIT-3R1',
                  labelStyle: TextStyle(
                    color: Colors.black
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(200)
                    ),
                  ),
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
                if(formKey.currentState!.validate()){
                  var thisTodo = TodoModel(
                    name: nameController.text,
                    section: sectionController.text
                  );
                  widget.insert(thisTodo);
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit')
            )
          ],
        )
      ),
    );
  }
}
