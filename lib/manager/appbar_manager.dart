import 'package:afiyetlistesi/view/Home/state/state_manage_home.dart';
import 'package:flutter/material.dart';

class AppBarManager {
  final bool isEditing;
  //final VoidCallback? onEditingToggle;

  AppBarManager({
    required this.isEditing,
    //this.onEditingToggle,
  });

  List<Widget> buildActionsForPage({
    required PageName currentPage,
  }) {
    switch (currentPage) {
      case PageName.favorite:
        return buildFavoritePageActions();
      case PageName.profile:
        return buildProfilePageActions();
      default:
        return [];
    }
  }

  List<Widget> buildFavoritePageActions() {
    return [
      IconButton(
        icon: const Icon(Icons.filter_alt_rounded),
        onPressed: () {
          // Favori sayfa için filtreleme işlevi
        },
      ),
    ];
  }

  List<Widget> buildProfilePageActions() {
    return [
      IconButton(
          icon: isEditing
              ? const Icon(Icons.check_rounded)
              : const Icon(Icons.edit_rounded),
          onPressed: () {}),
    ];
  }
}
