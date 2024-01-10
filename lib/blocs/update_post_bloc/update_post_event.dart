part of 'update_post_bloc.dart';

abstract class UpdatePostEvent extends Equatable {
  const UpdatePostEvent();

  @override
  List<Object> get props => [];
}

class UpdatePost extends UpdatePostEvent {
  final String userId;
  final String foodId;
  final String foodName;
  final String foodPhoto;
  final String foodMaterial;
  final String foodRecipe;
  final String foodCategory;

  const UpdatePost({
    required this.userId,
    required this.foodId,
    required this.foodName,
    required this.foodPhoto,
    required this.foodMaterial,
    required this.foodRecipe,
    required this.foodCategory,
  });
}
