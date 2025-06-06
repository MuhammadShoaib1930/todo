import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_state_menagment_bloc.dart';

class CostomedBottomNavigationBar extends StatefulWidget {
  const CostomedBottomNavigationBar({super.key});

  @override
  State<CostomedBottomNavigationBar> createState() =>
      _CostomedBottomNavigationBarState();
}

class _CostomedBottomNavigationBarState
    extends State<CostomedBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoStateMenagmentBloc, TodoState>(
      builder: (context, state) {
       
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: state.currentIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.mark_unread_chat_alt,),
                label: "Pandding",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_box),
                label: "Completed",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorited",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.delete),
                label: "Deleted",
              ),
            ],
            onTap: (value) {
              context.read<TodoStateMenagmentBloc>().add(ChangeScreenEvent(currentIndex: value));
            },
          );
        
      },
    );
  }
}
