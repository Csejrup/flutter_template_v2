import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/features/counter/presentation/pages/pages.dart';
import 'package:template/features/counter/presentation/widgets/app_scaffold.dart';

class AppRouter {
  static const home = 'counter';
  static const counter = 'counter';
}

final appRouter = GoRouter(
  debugLogDiagnostics: kDebugMode || kProfileMode,
  routes: [
    ShellRoute(
      builder: (context, state, navigator) {
        // Get reference to the GoRouter
        final goRouter = GoRouter.of(context);
        return AppScaffold(
          body: navigator,
          bottomNavigationBar: goRouter.location == '/subPage'
              ? null
              : BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: 'Business',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.school),
                      label: 'School',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        goRouter.push('/home');
                        break;
                      case 1:
                        goRouter.push('/business'); // replace with your route
                        break;
                      case 2:
                        goRouter.push('/school'); // replace with your route
                        break;
                      case 3:
                        goRouter.push('/settings'); // replace with your route
                        break;
                    }
                  },
                ),
        );
      },
      routes: [
        GoRoute(path: '/', redirect: (context, state) => '/home'),
        AppRoute('/home', (_) => const CounterPage()),
        AppRoute('/business', (_) => const BusinessPage()),
        AppRoute('/school', (_) => const SchoolPage()),
        AppRoute('/settings', (_) => const SettingsPage()),
      ],
    )
  ],
);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(
    String path,
    Widget Function(GoRouterState s) builder, {
    List<GoRoute> routes = const [],
    this.useFade = false,
  }) : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            return Platform.isIOS
                ? CupertinoPage(child: pageContent)
                : MaterialPage(child: pageContent);
          },
        );
  final bool useFade;
}
