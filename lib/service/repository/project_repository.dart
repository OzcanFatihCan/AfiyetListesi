import 'package:afiyetlistesi/service/model/favorite/favorite_model.dart';

abstract class ProjectRepository {
  Future<void> createFavorite(FavoriteModel userFavorite);

  Future<List<FavoriteModel>> getFavorite(String userId);

  Future<void> deleteFavorite(String userId, String favoriteId);
}
