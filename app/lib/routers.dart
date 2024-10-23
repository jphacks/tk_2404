import 'package:app/views/detail_view.dart';
import 'package:app/views/home_view.dart';
import 'package:app/views/login_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter routers = GoRouter(
  redirect: (context, state) {
    if (state.matchedLocation == '/') {
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => const DetailsView(),
    ),
  ],
);
