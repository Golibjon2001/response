part of 'home_bloc.dart';

@immutable
class HomeLoadState extends Equatable {
  final List<Post>? post;
  final FormzStatus? status;
  final bool isDelete;

  HomeLoadState({required this.isDelete, required this.status, required this.post});

  HomeLoadState copyWith({
    final List<Post>? post,
    final FormzStatus? status,
    final bool? isDelete,
  }) =>
      HomeLoadState(status: status ?? this.status, post: post ?? this.post,isDelete:isDelete ?? this.isDelete );

  @override
  List<Object?> get props => [status, post, isDelete];
}
