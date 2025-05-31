part of 'screen_changer_bloc.dart';

abstract class BaseEvent extends Equatable {
  const BaseEvent();

  @override
  List<Object> get props => [];
}
class ScreenChangerEvent extends BaseEvent{
  final int currentIndex;
  const ScreenChangerEvent({required this.currentIndex});
  @override
  List<Object> get props => [currentIndex];
}