import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_list_app/injection_container.dart';
import 'package:hotel_list_app/screen/venue_list_screen/venu_list.dart';
import 'package:hotel_list_app/core/theme/app_theme.dart';
import 'package:hotel_list_app/services/deep_link_service.dart';

import 'firebase_options.dart';
import 'generate/app_localizations.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final DeepLinkService deepLinkService = DeepLinkService();
  deepLinkService.init(navigatorKey);

  InjectionContainer.initializeDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hotel-list-app',
      navigatorKey: navigatorKey,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.defaultTheme,
      home: VenueListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
