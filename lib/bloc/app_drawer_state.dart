part of 'app_drawer_bloc.dart';

class AppDrawerState extends Equatable {
  final ThemeData themeData;
  const AppDrawerState({
    required this.themeData,
  });
  @override
  List<Object> get props => [
    themeData,
    
  ];
 
}
