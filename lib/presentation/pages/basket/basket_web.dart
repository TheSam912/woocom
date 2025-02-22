import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_lists.dart';
import '../../widgets/w_appbar.dart';
import '../../widgets/w_web_footer.dart';

class W_BasketWeb extends StatelessWidget {
  const W_BasketWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: wAppBarWeb(context, true),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(flex: 7, child: _buildCartList()),
                      Flexible(flex: 3, child: _buildSubTotal())
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            w_WebFooter()
          ],
        ),
      ),
    );
  }

  _buildCartList() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          _buildListAppBar(),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: AppLists.basketItems.length,
              itemBuilder: (context, index) {
                final item = AppLists.basketItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 6,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    item.images[0],
                                    fit: BoxFit.contain,
                                    width: 110,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultTextStyle(
                                      style: AppTextStyles.dynamicStyle(
                                          fontSize: 1.5.sp,
                                          fontWeight: FontWeight.w600),
                                      child: Text(
                                        item.headline,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      child: DefaultTextStyle(
                                        style: AppTextStyles.dynamicStyle(
                                          fontSize: 0.8.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff626262),
                                        ),
                                        child: Text(
                                          item.subHeadline,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    DefaultTextStyle(
                                      style: AppTextStyles.dynamicStyle(
                                        fontSize: 0.9.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff626262),
                                      ),
                                      child: const Text(
                                        "Qty- 1",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          child: DefaultTextStyle(
                            style: AppTextStyles.dynamicStyle(
                              fontSize: 0.9.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff626262),
                            ),
                            child: Text(
                              "${item.price} \$",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: DefaultTextStyle(
                            style: AppTextStyles.dynamicStyle(
                              fontSize: 0.9.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff626262),
                            ),
                            child: const Text(
                              "Qty- 1",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: DefaultTextStyle(
                            style: AppTextStyles.dynamicStyle(
                              fontSize: 0.9.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff626262),
                            ),
                            child: Text(
                              "${item.price} \$",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Apply Coupon",
                style: AppTextStyles.dynamicStyle(
                    fontSize: 1.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700),
              ),
              const Icon(
                Icons.arrow_drop_down_outlined,
                color: AppColors.primary,
                size: 40,
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          Container(
            width: 350,
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.accent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Apply Coupon Code",
                  style: AppTextStyles.dynamicStyle(
                      fontSize: 1.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Check",
                  style: AppTextStyles.dynamicStyle(
                      fontSize: 1.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildListAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 6,
            child: Container(
              width: double.infinity,
              child: Text(
                "Product Name",
                style: AppTextStyles.dynamicStyle(
                    fontSize: 1.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Price",
                style: AppTextStyles.dynamicStyle(
                    fontSize: 1.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Qty",
                style: AppTextStyles.dynamicStyle(
                    fontSize: 1.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Subtotal",
                style: AppTextStyles.dynamicStyle(
                    fontSize: 1.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      );

  _buildTextItemPrice(text, price, isGrand) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultTextStyle(
              style: AppTextStyles.dynamicStyle(
                fontSize: isGrand ? 1.1.sp : 0.9.sp,
                fontWeight: isGrand ? FontWeight.w700 : FontWeight.w600,
                color: const Color(0xff626262),
              ),
              child: Text(
                text,
              ),
            ),
            DefaultTextStyle(
              style: AppTextStyles.dynamicStyle(
                fontSize: isGrand ? 1.1.sp : 0.9.sp,
                fontWeight: isGrand ? FontWeight.w700 : FontWeight.w600,
                color: const Color(0xff626262),
              ),
              child: Text(
                price,
              ),
            ),
          ],
        ),
      );

  _buildSubTotal() => Container(
        height: 400,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Order Summary",
              style: AppTextStyles.dynamicStyle(
                  fontSize: 1.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700),
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTextItemPrice("Sub total", "\$119.69", false),
                _buildTextItemPrice("Discount", "-\$13.40", false),
                _buildTextItemPrice("Delivery Fee", "-\$0.00", false),
                _buildTextItemPrice("Grand Total", "\$106.29", true),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primary),
                      child: Text(
                        "Place Order",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: 1.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border:
                              Border.all(color: AppColors.primary, width: 1)),
                      child: Text(
                        "Continue Shopping",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: 1.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
