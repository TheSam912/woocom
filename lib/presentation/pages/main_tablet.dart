import 'package:ecommerce_woocom/presentation/widgets/w_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: wAppbarMobile(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              child: Image.asset(
                AppAssets.banner_mobile,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
