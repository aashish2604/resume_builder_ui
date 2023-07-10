import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_ui/screens/home_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:resume_builder_ui/services/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///The builder part is responsible for the responsiveness
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        defaultScale: true,
        breakpoints: [
          // const ResponsiveBreakpoint.resize(200,
          //     name: MOBILE, scaleFactor: 0.7),
          // const ResponsiveBreakpoint.resize(450,
          //     name: MOBILE, scaleFactor: 0.7),
          const ResponsiveBreakpoint.resize(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.resize(2460, name: "4K"),
        ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Resume Generator',
      navigatorKey: navigatorKey,
      theme: AppTheme().lightTheme(),
      home: const HomeScreen(),
    );
  }
}
