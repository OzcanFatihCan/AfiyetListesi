import 'package:afiyetlistesi/service/repository/project_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_favorite_event.dart';
part 'delete_favorite_state.dart';

class DeleteFavoriteBloc
    extends Bloc<DeleteFavoriteEvent, DeleteFavoriteState> {
  final ProjectRepository _projectRepository;
  DeleteFavoriteBloc({
    required ProjectRepository projectRepository,
  })  : _projectRepository = projectRepository,
        super(DeleteFavoriteInitial()) {
    on<DeleteFavorite>((event, emit) async {
      emit(DeleteFavoriteLoading());
      try {
        await _projectRepository.deleteFavorite(event.userId, event.favoriteId);
        emit(DeleteFavoriteSuccess());
      } catch (e) {
        emit(DeleteFavoriteFailure());
      }
    });
  }
}
