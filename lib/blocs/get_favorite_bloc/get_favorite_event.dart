part of 'get_favorite_bloc.dart';

abstract class GetFavoriteEvent extends Equatable {
  const GetFavoriteEvent();

  @override
  List<Object> get props => [];
}

class GetFavorite extends GetFavoriteEvent {
  final String userId;
  const GetFavorite({required this.userId});
}
