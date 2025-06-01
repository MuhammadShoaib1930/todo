
import 'package:flutter/material.dart';
import 'package:todo/widgets/add_new_todo.dart';

class CostomedFloatingActionButton extends StatelessWidget{
  const CostomedFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: (){
      showDialog(context: context, builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: AddNewTodo(),
        );
      },);
    },child: Icon(Icons.add),);
  }

}