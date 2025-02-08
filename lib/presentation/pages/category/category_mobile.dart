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
      appBar: const PreferredSize(preferredSize: Size(0, 0), child: Center()),
      body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              _customAppbarWidget(context),
              _floatingButtons(),
              Divider(
                color: Colors.grey.shade300,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: isTablet ? 25 : 14),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isTablet ? 3 : 2,
                    childAspectRatio: isTablet ? 0.72 : 0.68,
                    crossAxisSpacing: isTablet ? 20 : 14),
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
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              item.subHeadline,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: isTablet
                                  ? AppTextStyles.dynamicStyle(
                                      fontSize: 2.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade600)
                                  : AppTextStyles.dynamicStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade600),
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
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w700)
                                      : isTablet
                                          ? AppTextStyles.productPriceSaleTablet
                                          : AppTextStyles
                                              .productPriceSaleMobile),
                              const SizedBox(width: 8),
                              item.priceSale != 0.0
                                  ? Text("${item.priceSale} \$",
                                      style: isTablet
                                          ? AppTextStyles.dynamicStyle(
                                              fontSize: 3.sp,
                                              fontWeight: FontWeight.w700)
                                          : AppTextStyles.dynamicStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w700))
                                  : const Center(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }

  _floatingButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
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
                          style: isTablet
                              ? AppTextStyles.dynamicStyle(
                                  fontSize: 4.sp, fontWeight: FontWeight.w700)
                              : AppTextStyles.dynamicStyle(
                                  fontSize: 11.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
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
                          style: isTablet
                              ? AppTextStyles.dynamicStyle(
                                  fontSize: 4.sp, fontWeight: FontWeight.w700)
                              : AppTextStyles.dynamicStyle(
                                  fontSize: 11.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      );

  _customAppbarWidget(context) => Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black,
                  size: isTablet ? 40 : 30,
                )),
            Text(
              "HandBags",
              style: AppTextStyles.dynamicStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                  size: isTablet ? 40 : 30,
                )),
          ],
        ),
      );
}
