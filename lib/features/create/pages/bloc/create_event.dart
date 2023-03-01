part of 'create_bloc.dart';

@immutable
abstract class CreateEvent {}

class CreatePostEvent extends CreateEvent{

  final Post post;

  CreatePostEvent({required this.post});
}
