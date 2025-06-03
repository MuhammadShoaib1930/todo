import 'package:hive/hive.dart';
import 'package:todo/app_constant/app_constant.dart';

class ThemePreference {
  static final ThemePreference _instance = ThemePreference._internal();
  ThemePreference._internal();
  factory ThemePreference()=>_instance;
  static const _keyIsDark = 'isDark';
  late final Box _box;
  Future<void> init() async {
    _box = await Hive.openBox(AppConstant.settingsDatabaseName);
  }
  bool get isDark {
    if (!_box.isOpen) {
      
      return false; 
    }
    return _box.get(_keyIsDark, defaultValue: false);
  }

  Future<void> setDark(bool value) async {
    await _box.put(_keyIsDark, value);
  }
}
