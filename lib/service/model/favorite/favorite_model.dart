import 'package:afiyetlistesi/service/model/favorite/favorite_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

// ignore: must_be_immutable
class FavoriteModel extends Equatable {
  FavoriteModel({required this.favorite});
  Post favorite;

  static final empty = FavoriteModel(
    favorite: Post.empty,
  );

  FavoriteModel copyWith({
    Post? favorite,
  }) {
    return FavoriteModel(
      favorite: favorite ?? this.favorite,
    );
  }

  bool get isEmpty => this == FavoriteModel.empty;
  bool get isNotEmpyt => this != FavoriteModel.empty;

  FavoriteEntity toEntity() {
    return FavoriteEntity(favorite: favorite);
  }

  static FavoriteModel fromEntity(FavoriteEntity entity) {
    return FavoriteModel(
      favorite: entity.favorite,
    );
  }

  @override
  List<Object?> get props => [favorite];

  @override
  String toString() {
    return '''FavoriteModel: {
       'favorite': $favorite
    }''';
  }
}
