part of 'get_post_bloc.dart';

abstract class GetPostEvent extends Equatable {
  const GetPostEvent();

  @override
  List<Object> get props => [];
}

class GetPosts extends GetPostEvent {
  final String userId;

  const GetPosts({required this.userId});

  @override
  List<Object> get props => [userId];
}
