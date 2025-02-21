import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/w_admin_page_appbar.dart';
import '../../../widgets/w_categories_admin_list_tile.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const W_AdminPageAppBar(
              pageTitle: "Categories",
              btnTitle: "+ Add Category",
              selectedItems: [],
            ),
            W_CateoriesAdminListTile()
          ],
        ),
      ),
    );
  }
}
