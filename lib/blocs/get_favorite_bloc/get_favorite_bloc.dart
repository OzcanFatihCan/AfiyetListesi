import 'package:afiyetlistesi/service/model/favorite/favorite_model.dart';
import 'package:afiyetlistesi/service/repository/project_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_favorite_event.dart';
part 'get_favorite_state.dart';

class GetFavoriteBloc extends Bloc<GetFavoriteEvent, GetFavoriteState> {
  final ProjectRepository _projectRepository;
  GetFavoriteBloc({
    required ProjectRepository projectRepository,
  })  : _projectRepository = projectRepository,
        super(GetFavoriteInitial()) {
    on<GetFavorite>((event, emit) async {
      emit(GetFavoriteLoading());
      try {
        List<FavoriteModel> userFavorite =
            await _projectRepository.getFavorite(event.userId);
        emit(GetFavoriteSuccess(favorite: userFavorite));
      } catch (e) {
        emit(GetFavoriteFailure());
      }
    });
  }
}
