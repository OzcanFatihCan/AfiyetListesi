import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';

part 'update_post_event.dart';
part 'update_post_state.dart';

class UpdatePostBloc extends Bloc<UpdatePostEvent, UpdatePostState> {
  final PostRepository _postRepository;
  UpdatePostBloc({
    required PostRepository myPostRepository,
  })  : _postRepository = myPostRepository,
        super(UpdatePostInitial()) {
    on<UpdatePost>((event, emit) async {
      emit(UpdatePostLoading());
      try {
        Post post = await _postRepository.updatePost(event.post);
        emit(UpdatePostSuccess(post: post));
      } catch (e) {
        emit(UpdatePostFailed());
      }
    });
  }
}
