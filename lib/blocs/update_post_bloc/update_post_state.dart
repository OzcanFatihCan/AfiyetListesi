part of 'update_post_bloc.dart';

abstract class UpdatePostState extends Equatable {
  const UpdatePostState();

  @override
  List<Object> get props => [];
}

final class UpdatePostInitial extends UpdatePostState {}

final class UpdatePostFailed extends UpdatePostState {}

final class UpdatePostLoading extends UpdatePostState {}

final class UpdatePostSuccess extends UpdatePostState {
  final Post post;
  const UpdatePostSuccess({required this.post});
}
