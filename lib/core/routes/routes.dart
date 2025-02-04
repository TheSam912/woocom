import 'package:ecommerce_woocom/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

Widget myTransition(child, animation) {
  return FadeTransition(opacity: CurveTween(curve: Curves.easeIn).animate(animation), child: child);
}

final GoRouter router =
    GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: "/app", routes: <RouteBase>[
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
  )
  // GoRoute(
  //   path: '/detail',
  //   name: "detail",
  //   parentNavigatorKey: _rootNavigatorKey,
  //   pageBuilder: (BuildContext context, GoRouterState state) {
  //     return CustomTransitionPage(
  //       key: state.pageKey,
  //       name: state.name,
  //       child: Detail(
  //         Id: state.uri.queryParameters['Id'] ?? "",
  //       ),
  //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //         return myTransition(child, animation);
  //       },
  //     );
  //   },
  // ),
]);
