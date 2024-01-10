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
        await _postRepository.updatePost(
          event.userId,
          event.foodId,
          event.foodName,
          event.foodPhoto,
          event.foodMaterial,
          event.foodRecipe,
          event.foodCategory,
        );
        emit(UpdatePostSuccess());
      } catch (e) {
        emit(UpdatePostFailed());
      }
    });
  }
}
