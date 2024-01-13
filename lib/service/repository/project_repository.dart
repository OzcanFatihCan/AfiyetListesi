import 'package:afiyetlistesi/service/model/favorite/favorite_model.dart';

abstract class ProjectRepository {
  Future<void> createFavorite(FavoriteModel userFavorite);

  Future<void> createPopular(FavoriteModel favoritePost);
}
