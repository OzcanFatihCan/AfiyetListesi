import 'package:afiyetlistesi/product/project_control_page.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:afiyetlistesi/view/FoodDetail/page/food_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/core/search_text_field.dart';
import 'package:afiyetlistesi/model/popular_food_model.dart';

part '../widget/content_button_widget.dart';
part '../widget/popular_card_widget.dart';

class PopularPageView extends StatefulWidget {
  const PopularPageView({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  State<PopularPageView> createState() => _PopularPageViewState();
}

class _PopularPageViewState extends State<PopularPageView>
    with _pageSize, _pageWord, _pageDuration {
  void _pageChangePopular(int index) {
    setState(
      () {
        widget._pageController.animateToPage(
          index,
          duration: Duration(seconds: duration),
          curve: Curves.decelerate,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Padding(
          padding: pagePadding2x,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeadTextWidget(context),
              SizedBox(height: spaceObjects),
              const SearchTextField(),
              SizedBox(height: spaceObjects),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _BuildContentButton(),
              ),
              SizedBox(height: spaceObjectsMin),
              _buildMiddleTextWidget(context),
              SizedBox(height: spaceObjects),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _BuildPopularWidget(),
              ),
              SizedBox(height: spaceObjectsMin),
            ],
          ),
        ),
      ),
    );
  }

  FittedBox _buildHeadTextWidget(BuildContext context) {
    return FittedBox(
      child: Text(
        softWrap: true,
        foodHeadText,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }

  Row _buildMiddleTextWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          foodIntermediateText,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        TextButton(
          onPressed: () {
            _pageChangePopular(PageName.foods.index);
          },
          child: Text(
            allFood,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        )
      ],
    );
  }
}

void _gotoDetailsPage(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (BuildContext context) => widget),
  );
}

class PopularFavoriteItems with _pageWord {
  late List<PopularFavoriteModel> cardItems;
  PopularFavoriteItems() {
    cardItems = [
      PopularFavoriteModel(
        id: 1,
        imagePath: photoUrl,
        title: "Bulgur Pilavı",
        category: 1,
        materialsFood: materialsFood,
        recipe: cookingRecipe,
      ),
      PopularFavoriteModel(
          id: 2, imagePath: photoUrl2, title: "Sütlaç", category: 2),
      PopularFavoriteModel(
          id: 3, imagePath: photoUrl3, title: "Taze Fasulye", category: 1),
      PopularFavoriteModel(
          id: 4, imagePath: photoUrl, title: "Bulgur Pilavı", category: 1),
      PopularFavoriteModel(
          id: 5, imagePath: photoUrl2, title: "Sütlaç", category: 2),
      PopularFavoriteModel(
          id: 6, imagePath: photoUrl3, title: "Taze Fasulye", category: 1),
    ];
  }
}

mixin _pageSize {
  //obj
  final double spaceObjects = 20;
  final double spaceObjectsMin = 10;
  final double foodPhotoHeightSize = 130;
  final double foodPhotoWidthSize = 120;

  //radius
  final halfRadius = const Radius.circular(15);

  //padding
  final pagePaddingx = const EdgeInsets.all(8.0);
  final pagePadding2x = const EdgeInsets.all(16.0);
  final buttonPaddingx = const EdgeInsets.symmetric(horizontal: 15);
  final listPaddingx = const EdgeInsets.symmetric(horizontal: 10);
  final imagePadding =
      const EdgeInsets.only(bottom: 16, right: 16, left: 16, top: 32);

  //elevation
  final double elevationValue = 8;
  final double elevationValueOff = 0;
}

mixin _pageWord {
  final foodHeadText = "Hamide'nin Lezzet Listesi";
  final foodIntermediateText = "En Sevilenler";
  final subtitleText = "Tarif için tıkla";
  final allFood = "Tümünü Gör";
  final foodNotFound = "Yemek adı yükleniyor...";
  final contentButtonTitles = [
    'Yemekler',
    'Tatlılar',
    'Turşular',
    'Reçeller',
    'İçecekler',
  ];

  final photoUrl =
      "https://cdn.yemek.com/mncrop/940/625/uploads/2015/05/bulgur-pilavi-yemekcom.jpg";
  final photoUrl2 =
      "https://cdn.yemek.com/mnresize/940/940/uploads/2015/03/ytk-firin-sutlac-site.jpg";
  final photoUrl3 =
      "https://www.diyetkolik.com/site_media/media/foodrecipe_images/tazefasulyeyemegi_1.jpg";

  final materialsFood = [
    "1 yemek kaşığı tereyağı",
    "1 yemek kaşığı zeytinyağı",
    "2 adet kuru soğan (yemeklik doğranmış)",
    "1 diş sarımsak",
    "2 adet yeşil biber (doğranmış)",
    "1 yemek kaşığı domates salçası",
    "1/2 yemek kaşığı biber salçası",
    "2 su bardağı pilavlık bulgur",
    "1 çay kaşığı tuz",
    "1 çay kaşığı karabiber",
    "1 çay kaşığı pul biber",
    "1 tatlı kaşığı kekik",
    "2 adet domates (rendelenmiş)",
    "4 su bardağı su",
  ];
  final cookingRecipe = [
    "Birer yemek kaşığı tereyağı ve zeytinyağını bir pilav tenceresinde kızdırın. Üzerine soğanları ilave edin.",
    "2 adet yemeklik doğranmış kuru soğanı da tencereye ekleyin ve pembeleşinceye kadar kavurun. 1 adet ezilmiş sarımsak ve 2 adet doğranmış yeşil biberi de ekleyin ve kavurun.",
    "1 yemek kaşığı domates salçası ve yarım yemek kaşığı biber salçasını da ekleyip kokusu çıkana kadar kavurun.",
    "Sonra 2 su bardağı pilavlık bulguru ekleyin.",
    "Baharat olarak 1'er çay kaşığı tuz, karabiber, pul biber ve 1 tatlı kaşığı kekik ilave edin.",
    "2 adet rendelenmiş domatesi ilave edin.",
    "4 su bardağı su ekledikten sonra tencerenin kapağını kapatıp pişmeye bırakın",
    "Bulgurlar göz göz olup suyunu çektiğinde ocağın altını kapatın.",
    "Pilavınızın altını kapatın ve dinlenmeye bırakın.",
  ];
}

mixin _pageDuration {
  final duration = 1;
}
