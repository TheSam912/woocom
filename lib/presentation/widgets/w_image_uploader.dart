import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProductImagePickerDialog extends StatefulWidget {
  @override
  _ProductImagePickerDialogState createState() =>
      _ProductImagePickerDialogState();
}

class _ProductImagePickerDialogState extends State<ProductImagePickerDialog> {
  List<File> selectedImages = []; // Store selected images

  void openImagePickerDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing the main dialog
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Image"),
          content: const Text("Pick an image for your product."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close only this dialog
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                );

                if (result != null) {
                  setState(() {
                    selectedImages.add(File(result.files.single.path!));
                  });
                }

                Navigator.pop(context); // Close only the image picker dialog
              },
              child: const Text("Select"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Upload Product Images"),
      content: SizedBox(
        height: 250,
        width: 600, // Adjust width for horizontal scrolling
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...selectedImages.map((file) => _buildImageBox(file)),
            _buildUploadBox(), // Always at the end
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Done"),
        ),
      ],
    );
  }

  Widget _buildImageBox(File file) {
    return Container(
      width: 250,
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
        image: DecorationImage(
          image: FileImage(file),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildUploadBox() {
    return GestureDetector(
      onTap: openImagePickerDialog, // Open image selection dialog
      child: Container(
        width: 250,
        height: 250,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[300],
        ),
        child: const Center(
          child: Icon(Icons.upload, size: 35, color: Colors.blue),
        ),
      ),
    );
  }
}
