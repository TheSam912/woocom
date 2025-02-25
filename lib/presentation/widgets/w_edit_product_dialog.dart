import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/product_model.dart';
import '../../data/models/product_review_model.dart';
import '../../data/providers/w_product_provider.dart';

void showEditProductDialog(
    BuildContext context, WidgetRef ref, ProductModel product) {
  final formKey = GlobalKey<FormState>();

  final headlineController = TextEditingController(text: product.headline);
  final subHeadlineController =
      TextEditingController(text: product.subHeadline);
  final descriptionController =
      TextEditingController(text: product.description);
  final priceController = TextEditingController(text: product.price.toString());
  final priceSaleController =
      TextEditingController(text: product.priceSale.toString());
  final quantityController =
      TextEditingController(text: product.quantity.toString());
  final rateController = TextEditingController(text: product.rate.toString());
  final imageController = TextEditingController();

  List<String> images = List.from(product.images);
  List<ProductReviewModel> reviews = List.from(product.reviews);

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
                    child: Text("Edit Product",
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
                            Map<String, dynamic> updatedFields = {};

                            // Check and update fields only if they are modified
                            if (headlineController.text.trim().isNotEmpty &&
                                headlineController.text.trim() !=
                                    product.headline) {
                              updatedFields['headline'] =
                                  headlineController.text.trim();
                            }

                            if (subHeadlineController.text.trim().isNotEmpty &&
                                subHeadlineController.text.trim() !=
                                    product.subHeadline) {
                              updatedFields['subHeadline'] =
                                  subHeadlineController.text.trim();
                            }

                            if (descriptionController.text.trim().isNotEmpty &&
                                descriptionController.text.trim() !=
                                    product.description) {
                              updatedFields['description'] =
                                  descriptionController.text.trim();
                            }

                            if (rateController.text.isNotEmpty &&
                                int.tryParse(rateController.text) != null &&
                                int.parse(rateController.text) !=
                                    product.rate) {
                              updatedFields['rate'] =
                                  int.parse(rateController.text);
                            }

                            if (priceController.text.isNotEmpty &&
                                double.tryParse(priceController.text) != null &&
                                double.parse(priceController.text) !=
                                    product.price) {
                              updatedFields['price'] =
                                  double.parse(priceController.text);
                            }

                            if (priceSaleController.text.isNotEmpty &&
                                double.tryParse(priceSaleController.text) !=
                                    null &&
                                double.parse(priceSaleController.text) !=
                                    product.priceSale) {
                              updatedFields['priceSale'] =
                                  double.parse(priceSaleController.text);
                            }

                            if (quantityController.text.isNotEmpty &&
                                int.tryParse(quantityController.text) != null &&
                                int.parse(quantityController.text) !=
                                    product.quantity) {
                              updatedFields['quantity'] =
                                  int.parse(quantityController.text);
                            }

                            if (images.isNotEmpty && images != product.images) {
                              updatedFields['images'] = images;
                            }

                            if (reviews.isNotEmpty &&
                                reviews != product.reviews) {
                              updatedFields['reviews'] =
                                  reviews.map((r) => r.toMap()).toList();
                            }
                            if (updatedFields.isNotEmpty) {
                              await ref
                                  .read(productServiceProvider)
                                  .updateProduct(product.id, updatedFields);
                              ref.invalidate(productProvider);
                            }

                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "Save Changes",
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

// 🔹 Section Title Widget
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
