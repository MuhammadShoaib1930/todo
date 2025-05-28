import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/uitilites/hive_servers/todo_servers.dart';
class ShowDialogAdd  {
  ShowDialogAdd(context) {
  TextEditingController titleController = TextEditingController();
  TextEditingController contantController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(child: Text("Add New Task")),
        content: SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 30,
              children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      label: Text("Title"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                  ),
                  TextField(
                    controller: contantController,
                    decoration: InputDecoration(
                      label: Text("Contant"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                  ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async{
              if(titleController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Places fill title and contant")));
              }
              TodoServers().addData(title: titleController.text.toString(), content: contantController.text.toString());
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Saved")));
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      );
    },
  );
}

}
