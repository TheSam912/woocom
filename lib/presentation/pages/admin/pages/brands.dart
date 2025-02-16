import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/w_admin_page_appbar.dart';
import '../../../widgets/w_brands_admin_list_tile.dart';
import '../../../widgets/w_categories_admin_list_tile.dart';

class BrandsScreen extends ConsumerWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            W_AdminPageAppBar(
              pageTitle: "Brands",
              btnTitle: "+ Add Brand",
              selectedItems: const [],
            ),
            W_BrandsAdminListTile()
          ],
        ),
      ),
    );
  }
}
