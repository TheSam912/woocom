import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

w_GridTiles() => ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
          child: Image.asset(
            AppAssets.grid_web_large,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 20),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.grid_web_small1), fit: BoxFit.fill)),
                  height: 250,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.grid_web_small2), fit: BoxFit.fill)),
                  height: 250,
                ),
              ),
            ],
          ),
        )
      ],
    );
