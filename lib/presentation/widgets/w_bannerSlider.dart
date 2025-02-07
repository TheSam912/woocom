import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

final List<String> imgList = [AppAssets.banner_web, AppAssets.banner1_web];

w_BannerSliderStatic(image, marginHorizontal) => Container(
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );

w_BannerSlider(image, marginHorizontal) => Container(
    margin: const EdgeInsets.only(top: 20),
    height: 500,
    child: CarouselSlider(
      options: CarouselOptions(autoPlay: true, viewportFraction: 1),
      items: imgList
          .map((item) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(item), fit: BoxFit.fill)),
                // child: Image.asset(
                //   item,
                //   fit: BoxFit.fill,
                // )
              ))
          .toList(),
    ));

w_BannerSlider_Mobile(image, tablet) => Container(
    height: tablet ? 250 : 170,
    margin: const EdgeInsets.only(top: 20),
    width: double.infinity,
    child: CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          viewportFraction: tablet ? 0.98 : 0.96,
          enableInfiniteScroll: true,
          enlargeCenterPage: true),
      items: imgList
          .map((item) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(item), fit: BoxFit.fill)),
                // child: Image.asset(
                //   item,
                //   fit: BoxFit.fill,
                // )
              ))
          .toList(),
    ));
