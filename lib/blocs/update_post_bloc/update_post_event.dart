part of 'update_post_bloc.dart';

abstract class UpdatePostEvent extends Equatable {
  const UpdatePostEvent();

  @override
  List<Object> get props => [];
}

class UpdatePost extends UpdatePostEvent {
  final Post post;
  const UpdatePost({required this.post});
}
