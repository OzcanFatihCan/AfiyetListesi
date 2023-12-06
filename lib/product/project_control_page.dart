enum PageName { popular, favorite, profile, foods }

extension PageNameExtension on PageName {
  String getPageTitle() {
    switch (this) {
      case PageName.popular:
        return 'Anasayfa';
      case PageName.favorite:
        return 'Favoriler';
      case PageName.profile:
        return 'Profil';
      case PageName.foods:
        return 'Yemekler';
      default:
        return '';
    }
  }
}
