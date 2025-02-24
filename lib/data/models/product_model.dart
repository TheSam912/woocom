import 'package:cloud_firestore/cloud_firestore.dart';
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

  ProductModel(
      this.id,
      this.headline,
      this.subHeadline,
      this.description,
      this.rate,
      this.price,
      this.priceSale,
      this.quantity,
      this.images,
      this.reviews);

  // ✅ Convert FireStore Document to Model
  factory ProductModel.fromFireStore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      data['id'],
      data['headline'],
      data['subHeadline'],
      data['description'],
      data['rate'],
      data['price'].toDouble(),
      data['priceSale'].toDouble(),
      data['quantity'],
      List<String>.from(data['images']),
      List<ProductReviewModel>.from(
          data['reviews']?.map((r) => ProductReviewModel.fromMap(r)) ?? []),
    );
  }

  // ✅ Convert Model to FireStore Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'headline': headline,
      'subHeadline': subHeadline,
      'description': description,
      'rate': rate,
      'price': price,
      'priceSale': priceSale,
      'quantity': quantity,
      'images': images,
      'reviews': reviews.map((r) => r.toMap()).toList(),
    };
  }
}
