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

  // ✅ Update Product Efficiently
  Future<void> updateProduct(ProductModel updatedProduct) async {
    Map<String, dynamic> updatedFields = {};

    final existingProduct = state.firstWhere((p) => p.id == updatedProduct.id,
        orElse: () => updatedProduct);

    if (updatedProduct.headline != existingProduct.headline) {
      updatedFields['headline'] = updatedProduct.headline;
    }
    if (updatedProduct.subHeadline != existingProduct.subHeadline) {
      updatedFields['subHeadline'] = updatedProduct.subHeadline;
    }
    if (updatedProduct.description != existingProduct.description) {
      updatedFields['description'] = updatedProduct.description;
    }
    if (updatedProduct.rate != existingProduct.rate) {
      updatedFields['rate'] = updatedProduct.rate;
    }
    if (updatedProduct.price != existingProduct.price) {
      updatedFields['price'] = updatedProduct.price;
    }
    if (updatedProduct.priceSale != existingProduct.priceSale) {
      updatedFields['priceSale'] = updatedProduct.priceSale;
    }
    if (updatedProduct.quantity != existingProduct.quantity) {
      updatedFields['quantity'] = updatedProduct.quantity;
    }
    if (updatedProduct.images != existingProduct.images) {
      updatedFields['images'] = updatedProduct.images;
    }
    if (updatedProduct.reviews != existingProduct.reviews) {
      updatedFields['reviews'] =
          updatedProduct.reviews.map((r) => r.toMap()).toList();
    }

    if (updatedFields.isNotEmpty) {
      await _productService.updateProduct(updatedProduct.id, updatedFields);
    }

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
