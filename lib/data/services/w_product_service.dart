import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  final CollectionReference _productCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(ProductModel product) async {
    try {
      await _productCollection.doc(product.id.toString()).set(product.toMap());
    } catch (e) {
      throw Exception("Failed to add product: $e");
    }
  }

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final querySnapshot = await _productCollection.get();
      return querySnapshot.docs
          .map((doc) => ProductModel.fromFireStore(doc))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch products: $e");
    }
  }

  Future<void> updateProduct(
      int productId, Map<String, dynamic> updatedFields) async {
    try {
      await _productCollection.doc(productId.toString()).update(updatedFields);
    } catch (e) {
      throw Exception("Failed to update product: $e");
    }
  }

  Future<void> deleteProduct(int productId) async {
    try {
      await _productCollection.doc(productId.toString()).delete();
    } catch (e) {
      throw Exception("Failed to delete product: $e");
    }
  }
}
