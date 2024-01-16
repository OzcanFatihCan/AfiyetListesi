part of 'delete_favorite_bloc.dart';

abstract class DeleteFavoriteState extends Equatable {
  const DeleteFavoriteState();

  @override
  List<Object> get props => [];
}

final class DeleteFavoriteInitial extends DeleteFavoriteState {}

final class DeleteFavoriteFailure extends DeleteFavoriteState {}

final class DeleteFavoriteLoading extends DeleteFavoriteState {}

final class DeleteFavoriteSuccess extends DeleteFavoriteState {}
