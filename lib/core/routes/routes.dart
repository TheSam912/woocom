import 'package:ecommerce_woocom/app.dart';
import 'package:ecommerce_woocom/presentation/pages/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/product_model.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

Widget myTransition(child, animation) {
  return FadeTransition(opacity: CurveTween(curve: Curves.easeIn).animate(animation), child: child);
}

final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/app",
    routes: <RouteBase>[
      GoRoute(
        path: '/app',
        name: 'app',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: const App(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return myTransition(child, animation);
            },
          );
        },
      ),
      GoRoute(
        path: '/product_detail',
        name: 'product_detail',
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return CustomTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: ProductDetail(
              product: extra?['product'] as ProductModel,
              isWeb: extra?['isWeb'] as bool,
              isTablet: extra?['isTablet'] as bool,
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return myTransition(child, animation);
            },
          );
        },
      )
    ]);
