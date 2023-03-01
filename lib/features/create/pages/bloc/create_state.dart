part of 'create_bloc.dart';

@immutable
class CreateState extends Equatable {
  final Post? post;
  final FormzStatus? status;

  const CreateState({required this.status, required this.post});

  CreateState copyWith({
    final Post? post,
    final FormzStatus? status,
  }) =>
      CreateState(
        status: status ?? this.status,
        post: post ?? this.post,
      );

  @override
  List<Object?> get props => [status, post];
}
