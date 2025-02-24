import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/product_model.dart';
import '../../data/models/product_review_model.dart';
import '../../data/providers/w_product_provider.dart';

void showAddProductDialog(BuildContext context, WidgetRef ref) {
  final formKey = GlobalKey<FormState>();

  final headlineController = TextEditingController();
  final subHeadlineController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final priceSaleController = TextEditingController();
  final quantityController = TextEditingController();
  final rateController = TextEditingController();
  final imageController = TextEditingController();
  final reviewUserController = TextEditingController();
  final reviewTextController = TextEditingController();
  final reviewRateController = TextEditingController();

  List<String> images = [];
  List<ProductReviewModel> reviews = [];

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text("+ Add New Product",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: 2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary)),
                  ),
                  const SizedBox(height: 16),

                  // Product Fields
                  _buildTextField(headlineController, "Headline", Icons.title),
                  _buildTextField(
                      subHeadlineController, "Sub Headline", Icons.subtitles),
                  _buildTextField(
                      descriptionController, "Description", Icons.description),
                  _buildNumberField(
                      priceController, "Price", Icons.attach_money,
                      allowDecimals: true),
                  _buildNumberField(
                      priceSaleController, "Sale Price", Icons.money_off,
                      allowDecimals: true),
                  _buildNumberField(
                      quantityController, "Quantity", Icons.storage,
                      allowDecimals: false),
                  _buildRateField(rateController, "Rate (1-5)", Icons.star),

                  // Product Images
                  const SizedBox(height: 10),
                  _buildSectionTitle("Product Images"),
                  _buildImageInput(imageController, images),

                  // Product Reviews
                  const SizedBox(height: 10),
                  _buildSectionTitle("Product Reviews"),
                  _buildReviewRow(reviewUserController, reviewTextController,
                      reviewRateController, reviews),
                  if (reviews.isNotEmpty) _buildReviewList(reviews),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel",
                            style: TextStyle(color: Colors.red)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final newProduct = ProductModel(
                              DateTime.now().millisecondsSinceEpoch,
                              // Unique ID
                              headlineController.text,
                              subHeadlineController.text,
                              descriptionController.text,
                              int.parse(rateController.text),
                              double.parse(priceController.text),
                              double.parse(priceSaleController.text),
                              int.parse(quantityController.text),
                              images,
                              reviews,
                            );

                            await ref
                                .read(productServiceProvider)
                                .addProduct(newProduct);
                            ref.invalidate(
                                productProvider); // Refresh product list
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "Add Product",
                          style: AppTextStyles.dynamicStyle(
                              fontSize: 1.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

// 🔹 Review List (Displays Added Reviews)
Widget _buildReviewList(List<ProductReviewModel> reviews) {
  return Column(
    children: reviews
        .map((review) => ListTile(
              title: Text(review.username,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(review.review),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${review.rate} ⭐"),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      reviews.remove(review);
                    },
                  ),
                ],
              ),
            ))
        .toList(),
  );
}

// 🔹 Build a standard text field
Widget _buildTextField(
    TextEditingController controller, String label, IconData icon) {
  return _styledField(
    controller,
    label,
    icon,
    keyboardType: TextInputType.text,
    validator: (value) => value!.isEmpty ? "$label is required" : null,
  );
}

// 🔹 Number Input Field (Validates Number Format)
Widget _buildNumberField(
    TextEditingController controller, String label, IconData icon,
    {bool allowDecimals = false}) {
  return _styledField(
    controller,
    label,
    icon,
    keyboardType: allowDecimals
        ? const TextInputType.numberWithOptions(decimal: true)
        : TextInputType.number,
    validator: (value) {
      if (value!.isEmpty) return "$label is required";
      final numRegex =
          allowDecimals ? RegExp(r'^\d+(\.\d{1,2})?$') : RegExp(r'^\d+$');
      if (!numRegex.hasMatch(value)) return "Enter a valid number";
      return null;
    },
  );
}

// 🔹 Rate Input Field (Validates Range 1-5)
Widget _buildRateField(
    TextEditingController controller, String label, IconData icon) {
  return _styledField(
    controller,
    label,
    icon,
    keyboardType: TextInputType.number,
    validator: (value) {
      if (value!.isEmpty) return "$label is required";
      final numValue = int.tryParse(value);
      if (numValue == null || numValue < 1 || numValue > 5) {
        return "Enter a value between 1 and 5";
      }
      return null;
    },
  );
}

// 🔹 Shared Input Style
Widget _styledField(
    TextEditingController controller, String label, IconData icon,
    {TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.primary, width: 0.5),
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: InputBorder.none,
      ),
      validator: validator,
    ),
  );
}

// 🔹 Section Title
Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
  );
}

// 🔹 Image Input with Preview
Widget _buildImageInput(TextEditingController controller, List<String> images) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
              child: _buildTextField(controller, "Image URL", Icons.image)),
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.green),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                images.add(controller.text);
                controller.clear();
              }
            },
          ),
        ],
      ),
    ],
  );
}

// 🔹 Review Input Row
Widget _buildReviewRow(TextEditingController name, TextEditingController review,
    TextEditingController rate, List<ProductReviewModel> reviews) {
  return Row(
    children: [
      Expanded(child: _buildTextField(name, "Reviewer Name", Icons.person)),
      Expanded(child: _buildTextField(review, "Review", Icons.comment)),
      Expanded(child: _buildRateField(rate, "Rating (1-5)", Icons.star)),
      IconButton(
        icon: const Icon(Icons.add_circle, color: Colors.blue),
        onPressed: () {
          if (name.text.isNotEmpty &&
              review.text.isNotEmpty &&
              rate.text.isNotEmpty) {
            reviews.add(ProductReviewModel(
                reviews.length, name.text, review.text, int.parse(rate.text)));
            name.clear();
            review.clear();
            rate.clear();
          }
        },
      ),
    ],
  );
}
