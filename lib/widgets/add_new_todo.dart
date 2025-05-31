import 'package:flutter/material.dart';

class AddNewTodo extends StatelessWidget {
  const AddNewTodo({super.key});

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
              "New Task",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 250,
            child: TextFormField(
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
                  Navigator.pop(context);
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 20,)
            ],
          ),
        ],
      ),
    );
  }
}
