import 'package:afiyetlistesi/service/model/favorite/favorite_model.dart';
import 'package:afiyetlistesi/service/model/popular/popular_model.dart';

abstract class ProjectRepository {
  Future<void> createFavorite(FavoriteModel userFavorite);
  Future<void> createPopular(PopularModel userPopular);
}
