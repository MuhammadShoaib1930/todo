
import 'package:todo/import_packages/ui_packages.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: TodoServers().box().listenable(),
      builder: (context,allData, state) {
        List<TodoModel> data=allData.values.where((item) => !item.completed && item.favorite && !item.deleted ,).toList();
        return CostomedListViewBuilder(data: data);
      },
    );
  }
}