import 'dart:async';

import 'package:flutter/material.dart';
import '../features/auth/presentation/pages/login_page_admin.dart';
import '../features/pages/presentation/pages/admin_page.dart';
import '../features/posts/presentation/pages/posts_page.dart';
import '../features/posts/presentation/widgets/posts_page/post_list_widget.dart';
import '/core/pages/page_not_found.dart';
import '/features/auth/presentation/bloc/auth/auth_bloc.dart';

import '/features/auth/presentation/pages/login_page.dart';
import '/features/auth/presentation/pages/register_page.dart';
import '/features/auth/presentation/pages/update_user_page.dart';
import '../features/pages/presentation/pages/profile_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: 'authentication',
        builder: (context, state) {
          return LoginPage(); //PostsPage();
        },
        routes: [
          GoRoute(
            path: 'register',
            name: 'register',
            builder: (context, state) {
              return RegisterPage();
            },
          ),
          GoRoute(
            path: 'login',
            name: 'login',
            builder: (context, state) {
              return LoginPage();
            },
          ),
          GoRoute(
            path: 'update',
            name: 'update_user',
            builder: (context, state) {
              return UpdateUserPage();
            },
          ),
          GoRoute(
            path: 'admin_login',
            name: 'admin_login',
            builder: (context, state) {
              return LoginPageAdmin();
            },
          ),
        ],
      ),
      GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) {
            return ProfilePage();
          }),
      GoRoute(
          path: '/Posts',
          name: 'Posts',
          builder: (context, state) {
            return PostsPage();
          }),
      GoRoute(
          path: '/admin',
          name: 'admin',
          builder: (context, state) {
            return AdminPage();
          })
    ],
    errorBuilder: (context, state) => PageNotFound(),
    redirect: (context, state) {
      final bool unauthenticated = authBloc.state is UnAuthenticatedState;
      final bool authenticated = authBloc.state is AuthenticatedState;

      final bool isProfilePage = (state.subloc == '/profile');
      final bool isAuthOrLoginOrRegister = ((state.subloc == '/') ||
          (state.subloc == '/register') ||
          (state.subloc == '/login'));

      if (unauthenticated) {
        return isProfilePage ? '/' : null;
      }

      if (authenticated) {
        return isAuthOrLoginOrRegister ? '/profile' : null;
      }
    },
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
