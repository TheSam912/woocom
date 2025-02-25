import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_image_uploader.dart';
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
                    child: Text("Add New Product",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: 2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary)),
                  ),
                  const SizedBox(height: 16),
                  _buildUploadImage(context),
                  Row(
                    children: [
                      Flexible(
                        flex: 5,
                        child: _buildTextField(
                            headlineController, "Headline", Icons.title),
                      ),
                      Flexible(
                        flex: 5,
                        child: _buildTextField(subHeadlineController,
                            "Sub Headline", Icons.subtitles),
                      )
                    ],
                  ),
                  _buildTextField(
                      descriptionController, "Description", Icons.description),
                  Row(
                    children: [
                      Flexible(
                        flex: 5,
                        child: _buildNumberField(
                            priceController, "Price", Icons.attach_money,
                            allowDecimals: true),
                      ),
                      Flexible(
                        flex: 5,
                        child: _buildNumberField(
                            priceSaleController, "Sale Price", Icons.money_off,
                            allowDecimals: true),
                      ),
                      Flexible(
                        flex: 5,
                        child: _buildNumberField(
                            quantityController, "Quantity", Icons.storage,
                            allowDecimals: false),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel",
                              style: TextStyle(color: Colors.red)),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: GestureDetector(
                            onTap: () async {
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
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.primary),
                              child: Center(
                                child: Text(
                                  "SUBMIT",
                                  style: AppTextStyles.dynamicStyle(
                                      fontSize: 1.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            )),
                      )
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

_buildUploadImage(context) => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildBoxUploadImage(context),
        ],
      ),
    );

_buildBoxUploadImage(context) => GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ProductImagePickerDialog(),
        );
      },
      child: Container(
        width: 250,
        height: 250,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColors.accent),
        child: Center(
          child: Image.asset(
            AppIcons.upload,
            color: AppColors.primary,
            width: 35,
            height: 35,
          ),
        ),
      ),
    );

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
        prefixIcon: Icon(
          icon,
          color: AppColors.primary,
        ),
        border: InputBorder.none,
      ),
      validator: validator,
    ),
  );
}
