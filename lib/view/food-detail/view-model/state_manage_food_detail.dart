part of '../page/food_detail_page.dart';

abstract class StateManageFoodDetail extends State<FoodDetailPage> {
  Widget? detailWidget;
  TextEditingController foodNameController = TextEditingController();
  TextEditingController materialController = TextEditingController();
  TextEditingController recipeController = TextEditingController();
}
