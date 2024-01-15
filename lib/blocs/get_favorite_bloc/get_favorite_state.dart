part of 'get_favorite_bloc.dart';

abstract class GetFavoriteState extends Equatable {
  const GetFavoriteState();

  @override
  List<Object> get props => [];
}

final class GetFavoriteInitial extends GetFavoriteState {}

final class GetFavoriteFailure extends GetFavoriteState {}

final class GetFavoriteLoading extends GetFavoriteState {}

final class GetFavoriteSuccess extends GetFavoriteState {
  final List<FavoriteModel> favorite;
  const GetFavoriteSuccess({required this.favorite});
}
