import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:afiyetlistesi/view/FoodDetail/page/food_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/core/search_text_field.dart';
import 'package:afiyetlistesi/model/popular_food_model.dart';

class PopularPageView extends StatefulWidget {
  const PopularPageView({
    super.key,
  });

  @override
  State<PopularPageView> createState() => _PopularPageViewState();
}

class _PopularPageViewState extends State<PopularPageView>
    with _pageSize, _pageWord {
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
          onPressed: () {},
          child: Text(
            allFood,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        )
      ],
    );
  }
}

class _BuildContentButton extends StatefulWidget {
  const _BuildContentButton();

  @override
  State<_BuildContentButton> createState() => _BuildContentButtonState();
}

class _BuildContentButtonState extends State<_BuildContentButton>
    with _pageSize, _pageWord {
  late int selectedButtonIndex;

  @override
  void initState() {
    super.initState();
    selectedButtonIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      //kategoriler internetten çekildiğinde düzenlenecek.
      children: List.generate(contentButtonTitles.length, (index) {
        return Padding(
          padding: buttonPaddingx,
          child: _ButtonWidget(
            //buton isimleri yemek, turşu, içecek, reçel, tatlı,
            title: contentButtonTitles[index],
            onPressed: () {
              setState(() {
                selectedButtonIndex = index;
              });
            },
            isSelected: selectedButtonIndex == index,
          ),
        );
      }),
    );
  }
}

class _ButtonWidget extends StatelessWidget with _pageSize, _pageWord {
  _ButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isSelected = true,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //side: const BorderSide(color: _FoodPageColors.headColor),
        shape: const StadiumBorder(),
        elevation: elevationValueOff,
        backgroundColor: isSelected
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.surface,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: pagePaddingx,
        child: Text(
          title,
          style: isSelected
              ? AppTheme().customTextTheme().labelLarge
              : Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}

class _BuildPopularWidget extends StatefulWidget {
  const _BuildPopularWidget();

  @override
  State<_BuildPopularWidget> createState() => _BuildPopularWidgetState();
}

//popülerleri dışarıdan çekerken kontrol edilecek.
class _BuildPopularWidgetState extends State<_BuildPopularWidget>
    with _pageSize {
  late List<PopularFavoriteModel> _cardItems;
  @override
  void initState() {
    super.initState();
    _cardItems = PopularFavoriteItems().cardItems;
  }

  //örnek popülerden çekilen loading + veri işlemi burada yapılacak.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: listPaddingx,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.39,
        width: MediaQuery.of(context).size.width * 0.86,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _cardItems.length,
          itemBuilder: (context, index) {
            return _BuildPopularCard(model: _cardItems[index]);
          },
        ),
      ),
    );
  }
}

class _BuildPopularCard extends StatelessWidget with _pageSize, _pageWord {
  _BuildPopularCard({
    required PopularFavoriteModel model,
  }) : _model = model;

  final PopularFavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.48,
      child: InkWell(
        onTap: () {
          _gotoDetailsPage(context, FoodDetailPage(model: _model));
        },
        child: Card(
          shape: Theme.of(context).cardTheme.shape,
          color: Theme.of(context).cardTheme.color,
          child: Column(
            children: <Widget>[
              Padding(
                padding: imagePadding,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(halfRadius),
                  child: _model.imagePath.isNotEmpty
                      ? Image.network(
                          _model.imagePath,
                          height: foodPhotoHeightSize,
                          width: foodPhotoWidthSize,
                          fit: BoxFit.fitHeight,
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                              width: foodPhotoWidthSize,
                              height: foodPhotoHeightSize,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        )
                      : SizedBox(
                          height: foodPhotoHeightSize,
                          width: foodPhotoWidthSize,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: spaceObjects,
              ),
              Text(
                softWrap: true,
                _model.title.isNotEmpty ? _model.title : foodNotFound,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Padding(
                padding: pagePaddingx,
                child: Text(
                  subtitleText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
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
