import 'package:ecommerce_woocom/app.dart';
import 'package:ecommerce_woocom/core/repository/product_respository.dart';
import 'package:ecommerce_woocom/presentation/pages/admin/admin_web.dart';
import 'package:ecommerce_woocom/presentation/pages/basket/basket_mobile.dart';
import 'package:ecommerce_woocom/presentation/pages/category/category.dart';
import 'package:ecommerce_woocom/presentation/pages/image_slider/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/pages/authentication/authentication.dart';
import '../../presentation/pages/product_detail/product_detail.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

Widget myTransition(child, animation) {
  return FadeTransition(
      opacity: CurveTween(curve: Curves.easeIn).animate(animation),
      child: child);
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
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return myTransition(child, animation);
            },
          );
        },
      ),
      GoRoute(
        path: '/product_detail/:productId',
        name: 'product_detail',
        pageBuilder: (context, state) {
          final productId =
              state.pathParameters['productId']; // Get product ID from URL

          if (productId == null) {
            return const MaterialPage(
              child: Scaffold(
                body: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Invalid navigation! No product ID received.\nCome back and select product",
                  ),
                ),
              ),
            );
          }

          // Fetch product using productId from your product list or API
          final product = ProductRepository.getProductById(productId);

          if (product == null) {
            return const MaterialPage(
              child: Scaffold(
                body: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Product not found!",
                  ),
                ),
              ),
            );
          }

          return CustomTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: ProductDetail(product: product),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return myTransition(child, animation);
            },
          );
        },
      ),
      GoRoute(
        path: '/category',
        name: 'category',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: const Category(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return myTransition(child, animation);
            },
          );
        },
      ),
      GoRoute(
        path: '/basket_mobile',
        name: 'basket_mobile',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: BasketMobile(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return myTransition(child, animation);
            },
          );
        },
      ),
      GoRoute(
        path: '/authentication',
        name: 'authentication',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: Authentication(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return myTransition(child, animation);
            },
          );
        },
      ),
      GoRoute(
        path: '/admin',
        name: 'admin',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: const AdminWeb(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return myTransition(child, animation);
            },
          );
        },
      ),
      GoRoute(
        path: '/image_slider',
        name: 'image_slider',
        pageBuilder: (context, state) {
          final extra = state.extra as List<String>?;
          return CustomTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: ImageSlider(
              images: extra as List<String>,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return myTransition(child, animation);
            },
          );
        },
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        pageBuilder: (context, state) {
          final extra = state.extra as List<String>?;
          return CustomTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: ImageSlider(
              images: extra as List<String>,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return myTransition(child, animation);
            },
          );
        },
      ),
    ]);
