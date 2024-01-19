part of 'get_popular_bloc.dart';

abstract class GetPopularState extends Equatable {
  const GetPopularState();

  @override
  List<Object> get props => [];
}

final class GetPopularInitial extends GetPopularState {}

final class GetPopularFailure extends GetPopularState {}

final class GetPopularLoading extends GetPopularState {}

final class GetPopularSuccess extends GetPopularState {
  final List<PopularModel> popular;
  const GetPopularSuccess({required this.popular});
}
