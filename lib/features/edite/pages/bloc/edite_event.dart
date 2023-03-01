part of 'edite_bloc.dart';

@immutable
abstract class EditeEvent {}

class EditePostEvent extends EditeEvent {
  final Post post;

  EditePostEvent({required this.post});
}
