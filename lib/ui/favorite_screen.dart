import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/bloc/todo_state_menagment_bloc.dart';
import 'package:todo/hive_servers/todo_servers.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/costomed_detailed.dart';
import 'package:todo/widgets/editing_todo.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: TodoServers().box().listenable(),
      builder: (context,allData, state) {
        List<TodoModel> data=allData.values.where((item) => !item.completed && item.favorite && !item.deleted ,).toList();
        return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ExpansionTile(
                title: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Text(
                        data[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () async {
                        
                          
                          context.read<TodoStateMenagmentBloc>().add(
                          CompletedEvent(item: data[index],todoModelKey: data[index].key),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          context.read<TodoStateMenagmentBloc>().add(
                            FavoriteEvent(
                              item: data[index],
                              todoModelKey: data[index].key,
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: EditingTodo(
                                  item: data[index],
                                  todoModelKey: data[index].key,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        iconSize: 20,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: CostomedDetailed(item: data[index]),
                                ),
                          );
                        },
                        icon: Icon(Icons.info),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        icon: Icon(Icons.delete_outline),
                        onPressed: () {
                          context.read<TodoStateMenagmentBloc>().add(
                            DeletedEvent(
                              item: data[index],
                              todoModelKey: data[index].key,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                children: [Text(data[index].content)],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: data.length,
        );
      },
    );
  }
}
