import 'dart:async';

import 'package:app/view_model/firebase_state.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

class ShopifyCallbackState with ChangeNotifier {
  final FirebaseState firebaseState;
  String? _code;
  String? _state;
  StreamSubscription? _sub;
  final AppLinks _appLinks = AppLinks();

  String? get code => _code;
  String? get state => _state;

  ShopifyCallbackState(this.firebaseState) {
    _initDeepLinkListener();
  }

  void _initDeepLinkListener() {
    _sub = _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null && firebaseState.isAuthenticated) {
        if (uri.scheme == 'net.hekuta' &&
            uri.host == 'net.hekuta' &&
            uri.path == '/spotify/callback') {
          _code = uri.queryParameters['code'];
          _state = uri.queryParameters['state'];

          print('Code: $_code');
          print('State: $_state');

          notifyListeners();
        }
      }
    }, onError: (Object err) {
      print('Error receiving deep link: $err');
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
