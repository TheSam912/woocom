import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final CollectionReference _productCollection =
      FirebaseFirestore.instance.collection('products');

  // ✅ Add Product
  Future<void> addProduct(ProductModel product) async {
    try {
      await _productCollection.doc(product.id.toString()).set(product.toMap());
    } catch (e) {
      throw Exception("Failed to add product: $e");
    }
  }

  // ✅ Fetch Products
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

  // ✅ Update Product
  Future<void> updateProduct(ProductModel product) async {
    try {
      await _productCollection
          .doc(product.id.toString())
          .update(product.toMap());
    } catch (e) {
      throw Exception("Failed to update product: $e");
    }
  }

  // ✅ Delete Product
  Future<void> deleteProduct(int productId) async {
    try {
      await _productCollection.doc(productId.toString()).delete();
    } catch (e) {
      throw Exception("Failed to delete product: $e");
    }
  }
}
