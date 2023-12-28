part of '../page/food_add_page.dart';

abstract class StateManageFoodAdd extends State<FoodAddPageView>
    with _pageSize, _pageWord {
  late Post post;
  String? selectedCategory;
  CroppedFile? croppedFile;
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _recipeController = TextEditingController();
  final TextEditingController _foodNameController = TextEditingController();

  @override
  void initState() {
    post = Post.empty;
    post.myUser = widget.myUser;
    super.initState();
  }

  //photo picker
  foodPhotoPicker() async {
    ImagePickerHandler(
      context: context,
      onCroppedFile: (file) {
        setState(() {
          croppedFile = file;
        });
      },
    ).handleImageSelection();
  }

  //error control
  myErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: alertRadius,
          ),
          title: Text(
            alertTitle,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          content: Text(
            message,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(okButton),
            ),
          ],
        );
      },
    );
  }
}
