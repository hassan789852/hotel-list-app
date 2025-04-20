// lib/services/deep_link_service.dart

import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();

  /// Start listening to deep links.
  /// You need to pass the [navigatorKey] to allow navigation from anywhere.
  void init(GlobalKey<NavigatorState> navigatorKey) {
    // Handle initial (cold-start) deep link
    _appLinks.getInitialLink().then((initialLink) {
      _handleUri(initialLink, navigatorKey);
    });

    // Handle links while the app is running
    _appLinks.uriLinkStream.listen(( link) {
      _handleUri(link, navigatorKey);
    });
  }

  void _handleUri(Uri? uri, GlobalKey<NavigatorState> navigatorKey) {
    if (uri == null) return;

    debugPrint(' Received deep link: $uri');

    final segments = uri.pathSegments;

    // Example: https://privilee.com/item/123
    if (segments.length == 2 ) {
      // final productId = segments[1];
      // navigatorKey.currentState?.pushNamed('/product/$productId');
    }

    // Add more routes as needed here
  }
}
