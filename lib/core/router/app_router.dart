import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/widgets/foundation_placeholder_screen.dart';

/// Foundation Router configuration using GoRouter.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const FoundationPlaceholderScreen();
      },
    ),
  ],
);
