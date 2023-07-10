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
        // minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Amber IIT(ISM)',
      navigatorKey: navigatorKey,
      theme: AppTheme().lightTheme(),
      home: const HomeScreen(),
    );
  }
}
