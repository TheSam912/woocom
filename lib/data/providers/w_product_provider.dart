import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import '../services/w_product_service.dart';

final productServiceProvider = Provider((ref) => ProductService());

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  final ProductService _productService;

  ProductNotifier(this._productService) : super([]);

  // ✅ Load Products
  Future<void> loadProducts() async {
    state = await _productService.fetchProducts();
  }

  // ✅ Add Product
  Future<void> addProduct(ProductModel product) async {
    await _productService.addProduct(product);
    state = [...state, product];
  }

  // ✅ Update Product
  Future<void> updateProduct(ProductModel updatedProduct) async {
    await _productService.updateProduct(updatedProduct);
    state = state
        .map((p) => p.id == updatedProduct.id ? updatedProduct : p)
        .toList();
  }

  // ✅ Delete Product
  Future<void> deleteProduct(int productId) async {
    await _productService.deleteProduct(productId);
    state = state
        .where((p) => p.id != productId)
        .toList(); // Remove from local state
  }
}

final productProvider = FutureProvider<List<ProductModel>>((ref) async {
  final productService = ref.read(productServiceProvider);
  return productService.fetchProducts();
});
