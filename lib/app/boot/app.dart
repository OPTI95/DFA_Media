import 'package:flutter/material.dart';

import '../injection/app_dependency.dart';
import '../injection/dependency_injection.dart';
import '../navigation/router.dart';
import '../styles/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key, required this.appDependency});

  final AppDependency appDependency;

  @override
  Widget build(BuildContext context) {
    return DependencyInjection(
      key: const ValueKey("DependencyInjection"),
      appDependency: appDependency,
      child: MaterialApp.router(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
