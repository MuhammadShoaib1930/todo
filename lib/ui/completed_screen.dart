
import 'package:todo/import_packages/ui_packages.dart';
class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
   @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: TodoServers().box().listenable(),
      builder: (context,allData, state) {
        List<TodoModel> data=allData.values.where((item) => item.completed && !item.deleted).toList();
        return CostomedListViewBuilder(data: data);
      },
    );
  }
}