
import 'package:todo/import_packages/ui_packages.dart';

class PandingScreen extends StatefulWidget {
  const PandingScreen({super.key});

  @override
  State<PandingScreen> createState() => _PandingScreenState();
}

class _PandingScreenState extends State<PandingScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: TodoServers().box().listenable(),
      builder: (context,allData, state) {
        List<TodoModel> data=allData.values.where((item) => !item.completed && !item.deleted ,).toList();
        return CostomedListViewBuilder(data: data);
      },
    );
  }
}
