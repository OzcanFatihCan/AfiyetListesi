part of '../page/food_page.dart';

class _BuildFavoriteCard extends StatelessWidget with _pageSize, _pageWord {
  _BuildFavoriteCard({
    required Post model,
  }) : _model = model;

  final Post _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Theme.of(context).cardTheme.shape,
      color: Theme.of(context).cardColor,
      child: ListTile(
        title: Padding(
          padding: foodPadding,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(
                  halfRadius,
                ),
                child: _model.foodPhoto.isNotEmpty
                    ? Image.network(
                        _model.foodPhoto,
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                            width: MediaQuery.of(context).size.width,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ),
              Padding(
                padding: foodTextPadding,
                child: Text(
                  _model.foodName.isNotEmpty ? _model.foodName : foodNotFound,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Text(
                subtitleText,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
