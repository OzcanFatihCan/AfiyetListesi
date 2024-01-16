part of 'delete_favorite_bloc.dart';

abstract class DeleteFavoriteEvent extends Equatable {
  const DeleteFavoriteEvent();

  @override
  List<Object> get props => [];
}

class DeleteFavorite extends DeleteFavoriteEvent {
  final String userId;
  final String favoriteId;
  const DeleteFavorite({
    required this.userId,
    required this.favoriteId,
  });
}
