enum ItemsofAsset {
  wallpaperUrl,
  loginWallpaperUrl,
  profilBannerUrl,
  profilPhotoUrl,
  lottieLoading,
  lottieFood,
  lottieError,
  foodAdd
}

extension ItemsofAssetExtension on ItemsofAsset {
  String _path() {
    switch (this) {
      case ItemsofAsset.wallpaperUrl:
        return 'Wallpaper';
      case ItemsofAsset.loginWallpaperUrl:
        return 'LoginWallPaper';
      case ItemsofAsset.profilBannerUrl:
        return 'ProfilBanner';
      case ItemsofAsset.profilPhotoUrl:
        return 'PersonAvatar';
      case ItemsofAsset.lottieLoading:
        return 'LottieLoading';
      case ItemsofAsset.lottieFood:
        return 'LottieFood';
      case ItemsofAsset.lottieError:
        return 'LottieError';
      case ItemsofAsset.foodAdd:
        return 'FoodAdd';
    }
  }

  String get fetchPhoto => 'assets/picture/${_path()}.png';
  String get fetchLottie => 'assets/lottie/${_path()}.json';
}
