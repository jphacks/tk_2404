import 'package:app/views/detail_views.dart';
import 'package:app/views/home_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter routers = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => const DetailsView(),
    ),
  ],
);
