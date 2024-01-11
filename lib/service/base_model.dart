class BaseModel {
  String? foodName;
  List<String>? foodMaterials;
  String? foodPhoto;
  String? foodId;
  List<String>? foodRecipe;
  String? foodCategory;

  BaseModel(
      {this.foodName,
      this.foodMaterials,
      this.foodPhoto,
      this.foodId,
      this.foodRecipe,
      this.foodCategory});

  BaseModel.fromJson(Map<String, dynamic> json) {
    foodName = json['foodName'];
    foodMaterials = json['foodMaterials'].cast<String>();
    foodPhoto = json['foodPhoto'];
    foodId = json['foodId'];
    foodRecipe = json['foodRecipe'].cast<String>();
    foodCategory = json['foodCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodName'] = foodName;
    data['foodMaterials'] = foodMaterials;
    data['foodPhoto'] = foodPhoto;
    data['foodId'] = foodId;
    data['foodRecipe'] = foodRecipe;
    data['foodCategory'] = foodCategory;
    return data;
  }
}
