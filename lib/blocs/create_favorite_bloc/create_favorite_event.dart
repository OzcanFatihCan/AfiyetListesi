part of 'create_favorite_bloc.dart';

abstract class CreateFavoriteEvent extends Equatable {
  const CreateFavoriteEvent();

  @override
  List<Object> get props => [];
}

class CreateFavorite extends CreateFavoriteEvent {
  final FavoriteModel favorite;
  const CreateFavorite({required this.favorite});
}
