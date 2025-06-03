import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/app_drawer_bloc.dart';
import 'package:todo/bloc/todo_state_menagment_bloc.dart';
import 'package:todo/hive_servers/theme_preference.dart';
import 'package:todo/hive_servers/todo_servers.dart';
import 'package:todo/ui/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await TodoServers().init();
  await ThemePreference().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoStateMenagmentBloc()),
        BlocProvider(create: (context) => AppDrawerBloc()),
      ],
      child: BlocBuilder<AppDrawerBloc, AppDrawerState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
