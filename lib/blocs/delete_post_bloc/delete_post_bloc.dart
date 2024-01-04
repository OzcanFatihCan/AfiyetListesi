import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';

part 'delete_post_event.dart';
part 'delete_post_state.dart';

class DeletePostBloc extends Bloc<DeletePostEvent, DeletePostState> {
  final PostRepository _postRepository;
  DeletePostBloc({required PostRepository myPostRepository})
      : _postRepository = myPostRepository,
        super(DeletePostInitial()) {
    on<DeletePost>((event, emit) async {
      emit(DeletePostLoading());
      try {
        await _postRepository.deletePost(event.userId, event.postId);
        emit(DeletePostSuccess());
      } catch (e) {
        emit(DeletePostFailure());
      }
    });
  }
}
