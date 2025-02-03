import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_strings.dart';
import 'package:ecommerce_woocom/data/models/brand_model.dart';
import 'package:ecommerce_woocom/data/models/product_model.dart';
import 'package:ecommerce_woocom/data/models/product_review_model.dart';

class AppLists {
  static List<String> categories = [
    "Handbags",
    "Watches",
    "Skincare",
    "Jewellery",
    "Apparels",
  ];

  static List<BrandModel> brandList = [
    BrandModel("ZARA", AppAssets.brand_zara),
    BrandModel("Dolce Gabana", AppAssets.brand_dg),
    BrandModel("H&M", AppAssets.brand_hm),
    BrandModel("CHANEL", AppAssets.brand_chanel),
    BrandModel("Prada", AppAssets.brand_prada),
    BrandModel("BIBA", AppAssets.brand_biba)
  ];

  static List<ProductModel> productList = [
    ProductModel(0, "Coach", "Leather Coach Bag", AppStrings.lormIpsum, 4, 50.0, 35.99, 10, [
      AppAssets.productImage1,
      AppAssets.productImage1,
      AppAssets.productImage1,
      AppAssets.productImage1,
    ], [
      ProductReviewModel(1, "John Smith", "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(
          0, "Julia Piacere", "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(
          0, "Max Amoreni", "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(
          0, "Jesica lorz", "It has a perfect quality and the price is very good", 5),
    ]),
    //--------------------------------------------------------------------------------------------------------------
    ProductModel(2, "Grande", "Blossom Pouch", AppStrings.lormIpsum, 5, 99.0, 24.99, 20, [
      AppAssets.productImage2,
      AppAssets.productImage2,
      AppAssets.productImage2,
      AppAssets.productImage2,
    ], [
      ProductReviewModel(0, "John Smith", "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(
          0, "Julia Piacere", "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(
          0, "Max Amoreni", "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(
          0, "Jesica lorz", "It has a perfect quality and the price is very good", 5),
    ]),
    //--------------------------------------------------------------------------------------------------------------
    ProductModel(3, "Remus", "Brown Strap Bag", AppStrings.lormIpsum, 5, 89.99, 0.0, 20, [
      AppAssets.productImage3,
      AppAssets.productImage3,
      AppAssets.productImage3,
      AppAssets.productImage3,
    ], [
      ProductReviewModel(0, "John Smith", "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(
          0, "Julia Piacere", "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(
          0, "Max Amoreni", "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(
          0, "Jesica lorz", "It has a perfect quality and the price is very good", 5),
    ]),
    //--------------------------------------------------------------------------------------------------------------
    ProductModel(4, "Boujee", "Black Bag", AppStrings.lormIpsum, 5, 45.50, 0.0, 20, [
      AppAssets.productImage4,
      AppAssets.productImage4,
      AppAssets.productImage4,
      AppAssets.productImage4,
    ], [
      ProductReviewModel(0, "John Smith", "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(
          0, "Julia Piacere", "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(
          0, "Max Amoreni", "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(
          0, "Jesica lorz", "It has a perfect quality and the price is very good", 5),
    ]),
    //--------------------------------------------------------------------------------------------------------------
    ProductModel(5, "Coach", "Leather Coach Bag", AppStrings.lormIpsum, 4, 50.0, 35.99, 10, [
      AppAssets.productImage1,
      AppAssets.productImage1,
      AppAssets.productImage1,
      AppAssets.productImage1,
    ], [
      ProductReviewModel(1, "John Smith", "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(
          0, "Julia Piacere", "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(
          0, "Max Amoreni", "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(
          0, "Jesica lorz", "It has a perfect quality and the price is very good", 5),
    ]),
    //--------------------------------------------------------------------------------------------------------------
    ProductModel(6, "Grande", "Blossom Pouch", AppStrings.lormIpsum, 5, 99.0, 24.99, 20, [
      AppAssets.productImage2,
      AppAssets.productImage2,
      AppAssets.productImage2,
      AppAssets.productImage2,
    ], [
      ProductReviewModel(0, "John Smith", "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(
          0, "Julia Piacere", "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(
          0, "Max Amoreni", "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(
          0, "Jesica lorz", "It has a perfect quality and the price is very good", 5),
    ]),
  ];
}
