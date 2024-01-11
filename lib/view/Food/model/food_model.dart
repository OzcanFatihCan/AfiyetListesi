import 'package:afiyetlistesi/service/base_model.dart';

class FoodModel extends BaseModel {
  String? adminId;
  FoodModel(
      {this.adminId,
      required String foodName,
      required List<String> foodMaterials,
      required String foodPhoto,
      required String foodId,
      required List<String> foodRecipe,
      required String foodCategory})
      : super(
          foodId: foodId,
          foodName: foodName,
          foodMaterials: foodMaterials,
          foodPhoto: foodPhoto,
          foodRecipe: foodRecipe,
          foodCategory: foodCategory,
        );

  FoodModel.fromJson(Map<String, dynamic> json) {
    adminId = json['adminId'];
    foodName = json['foodName'];
    foodMaterials = json['foodMaterials'].cast<String>();
    foodPhoto = json['foodPhoto'];
    foodId = json['foodId'];
    foodRecipe = json['foodRecipe'].cast<String>();
    foodCategory = json['foodCategory'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adminId'] = adminId;
    data['foodName'] = foodName;
    data['foodMaterials'] = foodMaterials;
    data['foodPhoto'] = foodPhoto;
    data['foodId'] = foodId;
    data['foodRecipe'] = foodRecipe;
    data['foodCategory'] = foodCategory;
    return data;
  }
}
