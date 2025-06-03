
import 'package:todo/import_packages/bloc_packages.dart';
import 'package:todo/import_packages/ui_packages.dart';

part 'app_drawer_event.dart';
part 'app_drawer_state.dart';

class AppDrawerBloc extends Bloc<BaseAppDrawerEvent, AppDrawerState> {
  AppDrawerBloc() : super(AppDrawerState(themeData: ThemeData.light())) {
    on<ThemeChnagerEvent>(_themeChanger);
  }

  FutureOr<void> _themeChanger(ThemeChnagerEvent event, Emitter<AppDrawerState> emit) {
    emit(AppDrawerState(themeData:(event.isDark)? ThemeData.dark():ThemeData.light()));
  }

}