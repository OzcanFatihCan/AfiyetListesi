import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  final String wallpaperUrl;

  const BackGroundWidget({
    required this.wallpaperUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: wallpaperUrl.isNotEmpty
            ? DecorationImage(
                image: AssetImage(wallpaperUrl),
                fit: BoxFit.fitHeight,
              )
            : null,
      ),
      child: wallpaperUrl.isNotEmpty
          ? null
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
