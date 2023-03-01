part of 'edite_bloc.dart';

@immutable
class EditeState extends Equatable {
  final FormzStatus status;
  final Post? post;
  final bool isEdit;

  const EditeState({required this.isEdit, required this.status, required this.post});

  EditeState copyWith({
    final FormzStatus? status,
    final Post? post,
    final bool? isEdit,
  }) =>
      EditeState(
          isEdit: isEdit ?? this.isEdit,
          status: status ?? this.status,
          post: post ?? this.post);

  @override
  List<Object?> get props => [isEdit, status, post];
}
