import 'package:todo/app_constant/app_constant.dart';
import 'package:todo/bloc/app_drawer_bloc.dart';
import 'package:todo/import_packages/ui_packages.dart';

class CostomedDrawer extends StatefulWidget {
  const CostomedDrawer({super.key});

  @override
  State<CostomedDrawer> createState() => _CostomedDrawerState();
}

class _CostomedDrawerState extends State<CostomedDrawer> {
  final TextStyle titleStyle = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 111, 128, 136),
      elevation: 30,
      semanticLabel: "Settings",
      shadowColor: const Color.fromARGB(255, 1, 57, 160),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 200,
            child: DrawerHeader(child:CircleAvatar(backgroundImage: AssetImage(AppConstant.appImagePath),))),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              Text("Dark", style: titleStyle),
              BlocBuilder<AppDrawerBloc, AppDrawerState>(
                builder: (context, state) {
                  return Switch(
                    value: (state.themeData == ThemeData.dark()),
                    onChanged: (value) {
                      context.read<AppDrawerBloc>().add(
                        ThemeChnagerEvent(isDark: value),
                      );
                    },
                  );
                },
              ),
            ],
          ),

          Column(
            children: [
              Text("Clear all Data of: ", style: titleStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      TodoServers().deleteAllPadding();
                    },
                    child: Text("Padding", style: titleStyle),
                  ),
                  TextButton(
                    onPressed: () {
                      TodoServers().deleteAllComplete();
                    },
                    child: Text("Completed", style: titleStyle),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      TodoServers().deleteAllFavorate();
                    },
                    child: Text("Favorated", style: titleStyle),
                  ),
                  TextButton(
                    onPressed: () {
                      TodoServers().deleteAllDeleted();
                    },
                    child: Text("Deleted", style: titleStyle),
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              TodoServers().deleteAllData();
              context.read<AppDrawerBloc>().add(
                ThemeChnagerEvent(isDark: false),
              );
            },
            child: Text("Reset", style: titleStyle),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Row(
                        children: [
                          Image.asset(
                            AppConstant.appImagePath,
                            width: 24,
                            height: 24,
                          ),
          
                          SizedBox(width: 8),
                          Text("Todo v1.0"),
                        ],
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SelectableText(
                            "Developed by ${AppConstant.developerName}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          SelectableText(
                            AppConstant.developerContent,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          SelectableText(
                            AppConstant.developerGmail,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("CANCEL"),
                        ),
                      ],
                    ),
              );
            },
            child: Text("About App", style: titleStyle),
          ),
        ],
      ),
    );
  }
}
