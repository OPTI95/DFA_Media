import 'package:dfa_media/app/di/app_dependency.dart';
import 'package:flutter/material.dart';

final class DependencyInjection extends InheritedWidget {
  final AppDependency appDependency;

  const DependencyInjection(
      {super.key, required super.child, required this.appDependency});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppDependency of(BuildContext context) {
    final di = context.getInheritedWidgetOfExactType<DependencyInjection>();
    assert(di != null, "Dependency not found");
    return di!.appDependency;
  }
}
