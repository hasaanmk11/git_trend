import 'package:app/home/features/core/theme/theme_data.dart';
import 'package:app/home/features/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

/// The root widget of the Flutter application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp is the main app container that provides
    // routing, theming, localization, and other app-level features.
    return MaterialApp(
      // Title of the application (used by the OS)
      title: 'Flutter Demo',

      // Hides the debug banner in the top-right corner during development
      debugShowCheckedModeBanner: false,

      // Sets the theme of the application. Here, we are using a custom light theme.
      theme: AppTheme.lightTheme,

      // The first screen displayed when the app starts.
      home: HomePage(),
    );
  }
}
