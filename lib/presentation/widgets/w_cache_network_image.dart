import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

Widget W_CacheNetworkImage(image) {
  return CachedNetworkImage(
    imageUrl: image,
    fit: BoxFit.contain,
    placeholder: (context, url) => const Center(
      child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            color: AppColors.primary,
          )),
    ),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
