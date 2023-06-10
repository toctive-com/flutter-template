import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Global navigator key to be used by [GoRouter].
final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

/// Routes configuration for [GoRouter].
class RoutesConfig {
  /// [GoRouter] instance.
  static final GoRouter router = GoRouter(
    navigatorKey: globalNavigatorKey,
    debugLogDiagnostics: true,
    routerNeglect: true,
    initialLocation: '/',
    routes: <GoRoute>[],
  );
}
