import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/core/constants/app_strings.dart';
import 'package:ecommerce_woocom/data/models/brand_model.dart';
import 'package:ecommerce_woocom/data/models/category_model.dart';
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

  static List<String> sizes = [
    "Small",
    "Medium",
    "Large",
    "Travel",
    "Sport",
    "Pocket"
  ];

  static List<String> colors = [
    "Blue",
    "Maroon Red",
    "Crimson Red",
    "Seinna Pink",
    "Teal",
    "Aquamarine",
    "Muave Orange",
    "OFF White",
  ];

  static List<String> brands = [
    "Louis Vuitton",
    "NIKE",
    "Chanel",
    "Gucci",
    "Adidas",
    "Fendi",
    "Balenciaga",
    "Prada",
    "DKNY",
  ];

  static List<BrandModel> brandList = [
    BrandModel("ZARA", AppAssets.brand_zara),
    BrandModel("Dolce Gabana", AppAssets.brand_dg),
    BrandModel("H&M", AppAssets.brand_hm),
    BrandModel("CHANEL", AppAssets.brand_chanel),
    BrandModel("Prada", AppAssets.brand_prada),
    BrandModel("BIBA", AppAssets.brand_biba)
  ];

  static List<CategoryModel> categoriesListMobile = [
    CategoryModel("Skin Care", AppIcons.categorySkinCare),
    CategoryModel("Jewellery", AppIcons.categoryJewellery),
    CategoryModel("Hand Bags", AppIcons.categoryBags),
    CategoryModel("Watches", AppIcons.categoryWatches),
  ];

  static List<ProductModel> productList = [
    ProductModel(0, "Coach", AppStrings.product1SubHeadline,
        AppStrings.product1Description, 4, 50.0, 35.99, 10, [
      AppAssets.productImage1,
      AppAssets.productImage1,
      AppAssets.productImage1,
      AppAssets.productImage1,
    ], [
      ProductReviewModel(0, "John Smith",
          "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(0, "Julia Piacere",
          "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(0, "Max Amoreni",
          "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(0, "Jesica lorz",
          "It has a perfect quality and the price is very good", 5),
    ]),
    //--------------------------------------------------------------------------------------------------------------
    ProductModel(2, "Grande", AppStrings.product2SubHeadline,
        AppStrings.product2Description, 5, 99.0, 24.99, 20, [
      AppAssets.productImage2,
      AppAssets.productImage2,
      AppAssets.productImage2,
      AppAssets.productImage2,
    ], [
      ProductReviewModel(0, "John Smith",
          "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(0, "Julia Piacere",
          "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(0, "Max Amoreni",
          "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(0, "Jesica lorz",
          "It has a perfect quality and the price is very good", 5),
    ]),
    //--------------------------------------------------------------------------------------------------------------
    ProductModel(3, "Remus", AppStrings.product3SubHeadline,
        AppStrings.product3Description, 5, 89.99, 0.0, 20, [
      AppAssets.productImage3,
      AppAssets.productImage3,
      AppAssets.productImage3,
      AppAssets.productImage3,
    ], [
      ProductReviewModel(0, "John Smith",
          "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(0, "Julia Piacere",
          "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(0, "Max Amoreni",
          "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(0, "Jesica lorz",
          "It has a perfect quality and the price is very good", 5),
    ]),
    //--------------------------------------------------------------------------------------------------------------
    ProductModel(4, "Boujee", AppStrings.product4SubHeadline,
        AppStrings.product4Description, 5, 45.50, 0.0, 20, [
      AppAssets.productImage4,
      AppAssets.productImage4,
      AppAssets.productImage4,
      AppAssets.productImage4,
    ], [
      ProductReviewModel(0, "John Smith",
          "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(0, "Julia Piacere",
          "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(0, "Max Amoreni",
          "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(0, "Jesica lorz",
          "It has a perfect quality and the price is very good", 5),
    ]),
    //--------------------------------------------------------------------------------------------------------------
    ProductModel(5, "Coach", AppStrings.product1SubHeadline,
        AppStrings.product1Description, 4, 50.0, 35.99, 10, [
      AppAssets.productImage1,
      AppAssets.productImage1,
      AppAssets.productImage1,
      AppAssets.productImage1,
    ], [
      ProductReviewModel(1, "John Smith",
          "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(0, "Julia Piacere",
          "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(0, "Max Amoreni",
          "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(0, "Jesica lorz",
          "It has a perfect quality and the price is very good", 5),
    ]),
    //--------------------------------------------------------------------------------------------------------------
    ProductModel(6, "Grande", AppStrings.product2SubHeadline,
        AppStrings.product2Description, 5, 99.0, 24.99, 20, [
      AppAssets.productImage2,
      AppAssets.productImage2,
      AppAssets.productImage2,
      AppAssets.productImage2,
    ], [
      ProductReviewModel(0, "John Smith",
          "It has a perfect quality and the price is very good", 5),
      ProductReviewModel(0, "Julia Piacere",
          "It has a perfect quality and the price is very good", 3),
      ProductReviewModel(0, "Max Amoreni",
          "It has a perfect quality and the price is very good", 2),
      ProductReviewModel(0, "Jesica lorz",
          "It has a perfect quality and the price is very good", 5),
    ]),
  ];
}
