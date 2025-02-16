import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

final List images = [
  AppAssets.collectionImage1,
  AppAssets.collectionImage2,
  AppAssets.collectionImage3,
  AppAssets.collectionImage4,
  AppAssets.collectionImage5,
  AppAssets.collectionImage1,
  AppAssets.collectionImage2,
  AppAssets.collectionImage5,
  AppAssets.collectionImage1,
  AppAssets.collectionImage2,
  AppAssets.collectionImage3,
  AppAssets.collectionImage4,
  AppAssets.collectionImage5,
  AppAssets.collectionImage1,
  AppAssets.collectionImage2,
  AppAssets.collectionImage5,
];

W_CateoriesAdminListTile() => Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 1),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                    image: AssetImage(images[index]), fit: BoxFit.cover)),
          );
        },
      ),
    );
