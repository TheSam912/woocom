import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/product_model.dart';

class W_ProductImageSlider extends StatefulWidget {
  W_ProductImageSlider({
    super.key,
    required this.product,
    required this.isWeb,
    required this.isTablet,
  });

  ProductModel product;
  bool isWeb;
  bool isTablet;

  @override
  State<W_ProductImageSlider> createState() => _W_ProductImageSliderState();
}

class _W_ProductImageSliderState extends State<W_ProductImageSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.product.images
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: Stack(children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset(item, fit: BoxFit.contain)),
                Positioned(
                    bottom: 14,
                    right: 14,
                    child: Image.asset(
                      AppIcons.fullScreen,
                      width: 50,
                    )),
                widget.isWeb?Positioned(
                    bottom: 10, left: 0, right: 0, child: _indicationWidget()):const Center()
              ]),
            ))
        .toList();

    return Column(children: [
      GestureDetector(
          onTap: () =>
              context.pushNamed("image_slider", extra: widget.product.images),
          child: Stack(
            children: [
              CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: false,
                    viewportFraction: widget.isWeb
                        ? 0.85
                        : widget.isTablet
                            ? 0.6
                            : 1,
                    aspectRatio: widget.isWeb
                        ? 1.15
                        : widget.isTablet
                            ? 1.65
                            : 1,
                    // viewportFraction: widget.isTablet ? 0.6 : 1,
                    // aspectRatio: widget.isTablet ? 1.5 : 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ],
          )),
      widget.isWeb
          ? const Center()
          : widget.isTablet
              ? _indicationWidget()
              : _indicationWidget()
    ]);
  }

  _indicationWidget() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.product.images.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      );
}
