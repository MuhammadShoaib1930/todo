part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  final int index;
  const BottomNavigationState(this.index);
  
  @override
  List<Object> get props => [index];
}
