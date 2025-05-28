import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/bottom_navigation_bloc.dart';
import 'package:todo/ui/completed_tasks.dart';
import 'package:todo/ui/favourite_tasks.dart';
import 'package:todo/ui/pending_tasks_screen.dart';
import 'package:todo/ui/widgets/show_dialog_add.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
  PendingTasksScreen(),
  FavouriteTasks(),
  CompletedTasksState()
];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending Tasks"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Settings",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                leading: Icon(Icons.folder_copy),
                title: Text("My Tasks"),
                trailing: Text("03"),
              ),
            ),
            InkWell(
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text("Bin"),
                trailing: Text("0"),
              ),
            ),
            Center(child: Text("Dart Mode")),
            Switch(value: true, onChanged: (newValue) {}),
          ],
        ),
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            builder: (context, state) {
              return BottomNavigationBar(
                currentIndex: state.index,
                selectedItemColor: Colors.blue,
                onTap: (index) {
                  context.read<BottomNavigationBloc>().add(
                    BottomNavigationEvent(index),
                  );
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt),
                    label: "Pending Tasks",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline),
                    label: "Completed Tasks",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: "Favourite Tasks",
                  ),
                ],
              );
            },
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowDialogAdd(context);
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return _screens[state.index];
        },
      ),
    );
  }
}


