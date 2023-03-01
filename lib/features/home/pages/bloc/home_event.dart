part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeLoadPostEvent extends HomeEvent{}


class HomeDelatePostEvent extends HomeEvent{
  final Post? post;

  HomeDelatePostEvent({required this.post});
}


