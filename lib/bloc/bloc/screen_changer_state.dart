part of 'screen_changer_bloc.dart';

class ScreenChangerState extends Equatable {
  final int currentIndex;
  const ScreenChangerState({required this.currentIndex});
  
  @override
  List<Object> get props => [currentIndex];
}

