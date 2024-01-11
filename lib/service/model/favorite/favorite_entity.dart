import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

// ignore: must_be_immutable
class FavoriteEntity extends Equatable {
  FavoriteEntity({
    required this.favorite,
  });

  Post favorite;

  Map<String, Object?> toDocument() {
    return {
      'favorite': favorite.toEntity().toDocument(),
    };
  }

  static FavoriteEntity fromDocument(Map<String, dynamic> doc) {
    return FavoriteEntity(
      favorite: Post.fromEntity(
        PostEntity.fromDocument(doc['favorite']),
      ),
    );
  }

  @override
  List<Object?> get props => [favorite];

  @override
  String toString() {
    return '''FavoriteEntity: {
      'favorite': $favorite
    }''';
  }
}
