part of 'delete_post_bloc.dart';

abstract class DeletePostEvent extends Equatable {
  const DeletePostEvent();

  @override
  List<Object> get props => [];
}

class DeletePost extends DeletePostEvent {
  final String userId;
  final String postId;
  const DeletePost({
    required this.userId,
    required this.postId,
  });
}
