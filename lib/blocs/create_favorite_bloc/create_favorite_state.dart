part of 'create_favorite_bloc.dart';

abstract class CreateFavoriteState extends Equatable {
  const CreateFavoriteState();

  @override
  List<Object> get props => [];
}

final class CreateFavoriteInitial extends CreateFavoriteState {}

final class CreateFavoriteFailure extends CreateFavoriteState {}

final class CreateFavoriteLoading extends CreateFavoriteState {}

final class CreateFavoriteSuccess extends CreateFavoriteState {}
