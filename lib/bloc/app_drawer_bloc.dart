
import 'package:todo/hive_servers/theme_preference.dart';
import 'package:todo/import_packages/bloc_packages.dart';
import 'package:todo/import_packages/ui_packages.dart';

part 'app_drawer_event.dart';
part 'app_drawer_state.dart';

class AppDrawerBloc extends Bloc<BaseAppDrawerEvent, AppDrawerState> {
  AppDrawerBloc() : super(AppDrawerState(themeData: (ThemePreference().isDark)?ThemeData.dark():ThemeData.light())) {
    on<ThemeChnagerEvent>(_themeChanger);
  }

  FutureOr<void> _themeChanger(ThemeChnagerEvent event, Emitter<AppDrawerState> emit) {
    if(event.isDark){
      ThemePreference().setDark(event.isDark);
    emit(AppDrawerState(themeData:  ThemeData.dark()));

    }else{
      ThemePreference().setDark(event.isDark);
    emit(AppDrawerState(themeData:  ThemeData.light()));

    }
  }

}