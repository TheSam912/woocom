import '../../data/models/product_model.dart';
import '../../data/models/product_review_model.dart';
import '../constants/app_assets.dart';
import '../constants/app_strings.dart';

class ProductRepository {
  static List<ProductModel> productList = [
    ProductModel(0, "Coach", AppStrings.product1SubHeadline,
        AppStrings.product1Description, 4, 50.0, 35.99, 10, [
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product1.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product1.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product1.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product1.png"
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
    ProductModel(1, "Grande", AppStrings.product2SubHeadline,
        AppStrings.product2Description, 5, 99.0, 24.99, 20, [
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png",
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
    ProductModel(2, "Remus", AppStrings.product3SubHeadline,
        AppStrings.product3Description, 5, 89.99, 0.0, 20, [
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product3.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product3.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product3.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product3.png",
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
    ProductModel(3, "Boujee", AppStrings.product4SubHeadline,
        AppStrings.product4Description, 5, 45.50, 0.0, 20, [
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product4.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product4.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product4.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product4.png",
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
    ProductModel(4, "Coach", AppStrings.product1SubHeadline,
        AppStrings.product1Description, 4, 50.0, 35.99, 10, [
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product1.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product1.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product1.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product1.png"
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
    ProductModel(5, "Grande", AppStrings.product2SubHeadline,
        AppStrings.product2Description, 5, 99.0, 24.99, 20, [
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png",
      "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png"
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

  static ProductModel? getProductById(String productId) {
    return productList.firstWhere(
      (product) => product.id.toString() == productId,
    );
  }
}
