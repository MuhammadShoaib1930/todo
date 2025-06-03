import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_state_menagment_bloc.dart';

class AddNewTodo extends StatefulWidget {
  const AddNewTodo({super.key});

  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  TextEditingController titleTextEditingController = TextEditingController();

  TextEditingController contentTextEditingController = TextEditingController();
@override
  void dispose() {
    super.dispose();
    titleTextEditingController.dispose();
    contentTextEditingController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              " New Task ",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 250,
            child: TextFormField(
              controller: titleTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(25),
                ),
                labelText: "Title",
              ),
            ),
          ),
          SizedBox(
            width: 250,
            child: TextFormField(
              controller: contentTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(25),
                ),
                labelText: "content",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (titleTextEditingController.text.isEmpty &&
                      contentTextEditingController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Places fill the title and content"),
                      ),
                    );
                  } else if (contentTextEditingController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Places fill the content")),
                    );
                  } else if (titleTextEditingController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Places fill the title")),
                    );
                  } else {
                    String title = titleTextEditingController.text.toString();
                    String content =
                        contentTextEditingController.text.toString();
                    context.read<TodoStateMenagmentBloc>().add(
                      AddDataEvent(title: title, content: content),
                    );

                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}
