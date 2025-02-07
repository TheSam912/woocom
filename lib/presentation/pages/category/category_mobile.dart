import 'package:ecommerce_woocom/app.dart';
import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_lists.dart';

class CategoryMobile extends StatelessWidget {
  CategoryMobile({super.key, required this.isTablet});

  bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.72, crossAxisSpacing: 20),
        itemCount: AppLists.productList.length,
        itemBuilder: (context, index) {
          var item = AppLists.productList[index];
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                "product_detail",
                extra: {
                  "product": item,
                },
              );
            },
            child: Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(item.images[0]),
                  Text(
                    item.headline,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: isTablet
                        ? AppTextStyles.dynamicStyle(
                            fontSize: 3.sp, fontWeight: FontWeight.w700)
                        : AppTextStyles.dynamicStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      item.subHeadline,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: isTablet
                          ? AppTextStyles.dynamicStyle(
                              fontSize: 2.sp, fontWeight: FontWeight.w700)
                          : AppTextStyles.dynamicStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text("${item.price} \$",
                          style: item.priceSale == 0.0
                              ? isTablet
                                  ? AppTextStyles.dynamicStyle(
                                      fontSize: 3.sp,
                                      fontWeight: FontWeight.w700)
                                  : AppTextStyles.dynamicStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700)
                              : isTablet
                                  ? AppTextStyles.productPriceSaleTablet
                                  : AppTextStyles.productPriceSaleMobile),
                      const SizedBox(width: 8),
                      item.priceSale != 0.0
                          ? Text("${item.priceSale} \$",
                              style: isTablet
                                  ? AppTextStyles.dynamicStyle(
                                      fontSize: 3.sp,
                                      fontWeight: FontWeight.w700)
                                  : AppTextStyles.dynamicStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700))
                          : const Center(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _floatingButtons(),
    );
  }

  _floatingButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppIcons.sort,
                          width: 28,
                          height: 28,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              overlayColor:
                                  WidgetStatePropertyAll(Color(0xffffffff))),
                          child: Text(
                            "SORT",
                            style: AppTextStyles.dynamicStyle(
                                fontSize: 4.sp, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    )),
              )),
          Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppIcons.filter,
                          width: 28,
                          height: 28,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              overlayColor:
                                  WidgetStatePropertyAll(Color(0xffffffff))),
                          child: Text(
                            "FILTER",
                            style: AppTextStyles.dynamicStyle(
                                fontSize: 4.sp, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    )),
              ))
        ],
      );
}
