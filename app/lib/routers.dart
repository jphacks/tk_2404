import 'package:app/view_model/firebase_state.dart';
import 'package:app/views/detail_view.dart';
import 'package:app/views/home_view.dart';
import 'package:app/views/login_view.dart';
import 'package:app/views/signup_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter routers = GoRouter(
  redirect: (context, state) {
    final firebaseState = context.read<FirebaseState>(); // FirebaseStateを取得
    final isAuthenticated = firebaseState.isAuthenticated; // isLoggedInプロパティを使用

    print(state.matchedLocation);

    if (state.matchedLocation == '/' &&
        !isAuthenticated &&
        state.matchedLocation != '/signup') {
      print('to login');
      return '/login';
    }

    if (state.matchedLocation == '/signup' && isAuthenticated) {
      print('to home 1');
      return '/';
    }

    if (state.matchedLocation == '/login' && isAuthenticated) {
      print('to home 2');
      return '/';
    }

    return null; // それ以外はリダイレクトしない
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpView(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => const DetailsView(),
    ),
  ],
);
