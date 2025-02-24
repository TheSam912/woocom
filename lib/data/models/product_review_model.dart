class ProductReviewModel {
  int id;
  String username;
  String review;
  int rate;

  ProductReviewModel(this.id, this.username, this.review, this.rate);

  // ✅ Convert FireStore Document to Model
  factory ProductReviewModel.fromMap(Map<String, dynamic> data) {
    return ProductReviewModel(
      data['id'],
      data['username'],
      data['review'],
      data['rate'],
    );
  }

  // ✅ Convert Model to FireStore Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'review': review,
      'rate': rate,
    };
  }
}
