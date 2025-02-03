import 'package:flutter/cupertino.dart';

import '../../core/constants/app_assets.dart';

w_GridTiles() => ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
          child: Image.asset(AppAssets.grid_web_large),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 20),
          child: Row(
            children: [
              Flexible(flex: 5, child: Image.asset(AppAssets.grid_web_small1)),
              const SizedBox(
                width: 12,
              ),
              Flexible(flex: 5, child: Image.asset(AppAssets.grid_web_small2))
            ],
          ),
        )
      ],
    );
