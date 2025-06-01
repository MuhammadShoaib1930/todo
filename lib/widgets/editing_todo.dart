import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_state_menagment_bloc.dart';
import 'package:todo/models/todo_model.dart';

class EditingTodo extends StatefulWidget {
  const EditingTodo({super.key,required this.item, required this.todoModelKey});
  final int todoModelKey;
  final TodoModel item;

  @override
  State<EditingTodo> createState() => _EditingTodoState();
}

class _EditingTodoState extends State<EditingTodo> {
  final TextEditingController titleTextEditingController = TextEditingController();

  final TextEditingController contentTextEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    titleTextEditingController.dispose();
    contentTextEditingController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    titleTextEditingController.text = widget.item.title;
    contentTextEditingController.text = widget.item.content;
    return SizedBox(
      width: 200,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              " Editing Task ",
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
                      EditeEvent(content: content, title:  title, item: widget.item,todoModelKey: widget.todoModelKey),
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
