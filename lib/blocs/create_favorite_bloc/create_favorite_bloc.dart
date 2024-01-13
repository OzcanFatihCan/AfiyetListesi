import 'package:afiyetlistesi/service/model/favorite/favorite_model.dart';
import 'package:afiyetlistesi/service/repository/project_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_favorite_event.dart';
part 'create_favorite_state.dart';

class CreateFavoriteBloc
    extends Bloc<CreateFavoriteEvent, CreateFavoriteState> {
  final ProjectRepository _projectRepository;
  CreateFavoriteBloc({
    required ProjectRepository projectRepository,
  })  : _projectRepository = projectRepository,
        super(CreateFavoriteInitial()) {
    on<CreateFavorite>((event, emit) async {
      emit(CreateFavoriteLoading());
      try {
        await _projectRepository.createFavorite(event.favorite);
        emit(CreateFavoriteSuccess());
      } catch (e) {
        emit(CreateFavoriteFailure());
      }
    });
  }
}
