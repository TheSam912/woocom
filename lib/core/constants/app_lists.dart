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
}
