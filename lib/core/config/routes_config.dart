import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

class RoutesConfig {
  static final GoRouter router = GoRouter(
    navigatorKey: globalNavigatorKey,
    debugLogDiagnostics: true,
    routerNeglect: true,
    initialLocation: "/",
    routes: <GoRoute>[],
  );
}
