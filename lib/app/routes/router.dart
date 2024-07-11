import 'package:dfa_media/features/products/presentation/bloc/products_bloc.dart';
import 'package:dfa_media/features/products/presentation/pages/product_page.dart';
import 'package:dfa_media/features/shops/presentation/pages/shops_page.dart';
import 'package:dfa_media/features/support/presentation/pages/support_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/delivery/presentation/pages/delivery_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

abstract class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomePage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: Routes.home,
                builder: (context, state) => BlocProvider(
                  create: (context) => ProductsBloc(
                      //getPosts: DependencyInjection.of(context).getPosts,
                      ), //..getPosts(),
                  child: const ProductPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.delivery,
                path: '/delivery',
                builder: (context, state) => const DeliveryPage(),
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.shops,
                path: '/shops',
                builder: (context, state) => const ShopsPage(),
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.support,
                path: '/support',
                builder: (context, state) => const SupportPage(),
              )
            ],
          ),
        ],
      ),
    ],
  );
}
