import 'package:flutter/material.dart';
import 'package:todo_new/bloc/bloc/screen_changer_bloc.dart';
import 'package:todo_new/ui/completed_screen.dart';
import 'package:todo_new/ui/deleted_screen.dart';
import 'package:todo_new/ui/favorite_screen.dart';
import 'package:todo_new/ui/panding_screen.dart';
import 'package:todo_new/widgets/costomed_bottom_navigation_bar.dart';
import 'package:todo_new/widgets/costomed_floating_action_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<StatefulWidget> screens = [
    PandingScreen(),
    CompletedScreen(),
    FavoriteScreen(),
    DeletedScreen(),
  ];
  final List<String> title = [
    "Panding Tasks",
    "Completed Tasks",
    "Favorited Tasks",
    "Deleted Tasks",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ScreenChangerBloc , ScreenChangerState>(
          builder: (context, state) {
            return Text(title[state.currentIndex]);
          },
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CostomedBottomNavigationBar(),
      floatingActionButton: CostomedFloatingActionButton(),
      body: BlocBuilder<ScreenChangerBloc, ScreenChangerState>(
        builder: (context, state) {
          return screens[state.currentIndex];
        },
      ),
    );
  }
}
