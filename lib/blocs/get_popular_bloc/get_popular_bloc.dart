import 'package:afiyetlistesi/service/model/popular/popular_model.dart';
import 'package:afiyetlistesi/service/repository/project_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_popular_event.dart';
part 'get_popular_state.dart';

class GetPopularBloc extends Bloc<GetPopularEvent, GetPopularState> {
  final ProjectRepository _projectRepository;
  GetPopularBloc({
    required ProjectRepository projectRepository,
  })  : _projectRepository = projectRepository,
        super(GetPopularInitial()) {
    on<GetPopular>((event, emit) async {
      emit(GetPopularLoading());
      try {
        List<PopularModel> popularPost = await _projectRepository.getPopular();
        emit(
          GetPopularSuccess(popular: popularPost),
        );
      } catch (e) {
        emit(GetPopularFailure());
      }
    });
  }
}
