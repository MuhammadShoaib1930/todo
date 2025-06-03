
import 'package:todo/import_packages/ui_packages.dart';
class DeletedScreen extends StatefulWidget {
  const DeletedScreen({super.key});

  @override
  State<DeletedScreen> createState() => _DeletedScreenState();
}

class _DeletedScreenState extends State<DeletedScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: TodoServers().box().listenable(),
      builder: (context,allData, state) {
        List<TodoModel> data=allData.values.where((item) =>item.deleted ).toList();
        return CostomedListViewBuilder(data: data);
      },
    );
  }
}