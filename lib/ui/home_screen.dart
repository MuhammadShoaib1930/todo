
import 'package:todo/app_constant/app_constant.dart';
import 'package:todo/import_packages/ui_packages.dart';

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
        title: BlocBuilder<TodoStateMenagmentBloc , TodoState>(
          builder: (context, state) {
              return Text(title[state.currentIndex],style: AppConstant.textStyleTitle,);
          },
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CostomedBottomNavigationBar(),
      floatingActionButton: CostomedFloatingActionButton(),
      body: BlocBuilder<TodoStateMenagmentBloc, TodoState>(
        builder: (context, state) {
            return screens[state.currentIndex];
        },),
        drawer:CostomedDrawer(),

    );
  }
}
