import 'package:app/base.dart';
import 'package:app/view_model/firebase_state.dart';
import 'package:app/views/login_view.dart';
import 'package:app/views/signup_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter routers = GoRouter(
  redirect: (context, state) {
    final firebaseState = context.read<FirebaseState>();
    final isAuthenticated = firebaseState.isAuthenticated;

    if (state.matchedLocation == '/' &&
        !isAuthenticated &&
        state.matchedLocation != '/signup') {
      return '/login';
    }

    if (state.matchedLocation == '/signup' && isAuthenticated) {
      return '/';
    }

    if (state.matchedLocation == '/login' && isAuthenticated) {
      return '/';
    }

    return null; // それ以外はリダイレクトしない
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BasePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpView(),
    ),
  ],
);
