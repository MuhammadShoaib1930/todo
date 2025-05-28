import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/constant/hive_constants.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/ui/widgets/edite_dialog.dart';
import 'package:todo/ui/widgets/show_dialog_add.dart';
import 'package:todo/uitilites/hive_servers/todo_servers.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TodoModel>>(
      valueListenable: Hive.box<TodoModel>(HiveConstants.fileName).listenable(),
      builder: (context, box, _) {
        final List<TodoModel> todos = box.values.where((todo) => !todo.isComplete && !todo.isDelete && !todo.isFaverate).toList();
        
        return ListView.separated(
          padding:  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
          itemCount: todos.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ExpansionTile(
              backgroundColor: Colors.grey.shade300,
              collapsedBackgroundColor: Colors.grey.shade100,
              title: Text(todo.title,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: ()async {
                      bool isTrue = await TodoServers().faverated(index: index);
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: (isTrue)?Text("Deleted"):Text("Not Deleted")));
                      todos[index].delete();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: ()async {
                      EditeDialog(context,index,todo.title,todo.content);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async{
                      bool isTrue = await TodoServers().deleteToBin(index: index);
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: (isTrue)?Text("Deleted"):Text("Not Deleted")));
                      // Handle delete action
                      todos[index].delete();
                    },
                  ),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                  child: Text(todo.content,style: TextStyle(fontSize: 16),),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
