

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/app_constant/app_settings.dart';
import 'package:todo/bloc/todo_state_menagment_bloc.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/costomed_detailed.dart';
import 'package:todo/widgets/editing_todo.dart';

class CostomedListViewBuilder extends StatefulWidget {
  final List<TodoModel> data;
  const CostomedListViewBuilder({super.key,required this.data});

  @override
  State<CostomedListViewBuilder> createState() => _CostomedListViewBuilderState();
}

class _CostomedListViewBuilderState extends State<CostomedListViewBuilder> {
  final TextStyle titleStyle = TextStyle(
    fontSize: AppSettings.titleFont,
    fontWeight:  AppSettings.titlesBold,
  );
  final TextStyle contentStyle = TextStyle(
    fontSize: AppSettings.contentFont,
    fontWeight: AppSettings.contentBold,
  );
  @override
  Widget build(BuildContext context) {
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
                        widget.data[index].title,
                        style: titleStyle
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        icon: (widget.data[index].completed)?Icon(Icons.check,color: Colors.blue,): (Theme.of(context).brightness== Brightness.dark)?Icon(Icons.check,color: Colors.white):Icon(Icons.check,color: Colors.black),
                        onPressed: () async {
                        
                          
                          context.read<TodoStateMenagmentBloc>().add(
                          CompletedEvent(item: widget.data[index],todoModelKey: widget.data[index].key),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        icon: (widget.data[index].favorite)?Icon(Icons.favorite_rounded,color: Colors.blue,):(Theme.of(context).brightness== Brightness.dark)?Icon(Icons.favorite_border,color: Colors.white,):Icon(Icons.favorite_border,color: Colors.black,),
                        onPressed: () {
                          context.read<TodoStateMenagmentBloc>().add(
                            FavoriteEvent(
                              item: widget.data[index],
                              todoModelKey: widget.data[index].key,
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        icon: (Theme.of(context).brightness== Brightness.dark)?Icon(Icons.edit,color: Colors.white,):Icon(Icons.edit,color: Colors.black,),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: EditingTodo(
                                  item: widget.data[index],
                                  todoModelKey: widget.data[index].key,
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
                                  child: CostomedDetailed(item: widget.data[index]),
                                ),
                          );
                        },
                        icon:(Theme.of(context).brightness == Brightness.dark)? Icon(Icons.info,color: Colors.white,):Icon(Icons.info,color: Colors.black,),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        icon: (widget.data[index].deleted)?Icon(Icons.delete,color: Colors.blue,):(Theme.of(context).brightness == Brightness.dark)?Icon(Icons.delete_outline,color: Colors.white,):Icon(Icons.delete_outline,color: Colors.black,),
                        onPressed: () {
                          context.read<TodoStateMenagmentBloc>().add(
                            (widget.data[index].deleted)?
                            DeletedPermenantEvent(todoModelKey: widget.data[index].key)
                            :
                            DeletedEvent(
                              item: widget.data[index],
                              todoModelKey: widget.data[index].key,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                children: [Text(widget.data[index].content,style: contentStyle,)],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: widget.data.length,
        );
  }
}