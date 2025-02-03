import 'package:ecommerce_woocom/data/models/product_review_model.dart';

class ProductModel {
  int id;
  String headline;
  String subHeadline;
  String description;
  int rate;
  double price;
  double priceSale;
  int quantity;
  List<String> images;
  List<ProductReviewModel> reviews;

  ProductModel(this.id, this.headline, this.subHeadline, this.description, this.rate, this.price,
      this.priceSale, this.quantity, this.images, this.reviews);
}
