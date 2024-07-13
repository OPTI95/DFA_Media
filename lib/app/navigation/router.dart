import 'package:dfa_media/features/products/view/controller/banners/banners_bloc.dart';
import 'package:dfa_media/features/products/view/controller/products/products_bloc.dart';
import 'package:dfa_media/features/products/view/controller/story/story_bloc.dart';
import 'package:dfa_media/features/products/view/pages/product_page.dart';
import 'package:dfa_media/features/shops/view/pages/shops_page.dart';
import 'package:dfa_media/features/support/view/pages/support_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/delivery/view/pages/delivery_page.dart';
import '../../features/home/view/pages/home_page.dart';
import '../injection/dependency_injection.dart';
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
                builder: (context, state) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => ProductsBloc(
                        getProducts:
                            DependencyInjection.of(context).getProducts,
                      )..add(LoadProducts()),
                    ),
                    BlocProvider(
                      create: (context) => BannersBloc(
                        getBanners:
                            DependencyInjection.of(context).getBanners,
                      )..add(LoadBanners()),
                    ),
                    BlocProvider(
                      create: (context) => StoryBloc(
                        getStories:
                            DependencyInjection.of(context).getStories,
                      )..add(LoadStory()),
                    ),
                  ],
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
