import 'package:flutter/material.dart';

import '../../core/constants/app_lists.dart';

W_BrandsAdminListTile() => Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: AppLists.brandList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Image.asset(AppLists.brandList[index].logo),
              ),
            ),
          );
        },
      ),
    );
