import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_state_menagment_bloc.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/costomed_detailed.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoStateMenagmentBloc, TodoState>(
      builder: (context, state) {
        List<TodoModel> data = state.data.where((item) => item.completed && !item.deleted,).toList();
        if (data.isEmpty) {
          return Center(child: Text("No data founded"));
        } else {
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
                          icon: Icon(Icons.check, color: Colors.blue),

                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          icon:
                              (data[index].favorite)
                                  ? Icon(
                                    Icons.favorite_rounded,
                                    color: Colors.blue,
                                  )
                                  : Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                      ),
                      // Expanded(flex: 2, child: IconButton(icon: Icon(Icons.edit),onPressed: () {},)),
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
                          icon: Icon(Icons.delete_outline_rounded),
                          onPressed: () {},
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
        }
      },
    );
  }
}
