import 'package:flutter/material.dart';
import 'package:paradoxs_coffee/data/models/product/product_model.dart';

import 'package:paradoxs_coffee/ui/on_boarding/on_boarding_screen.dart';
import 'package:paradoxs_coffee/ui/splash/splash_screen.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/home_screen.dart';
import 'package:paradoxs_coffee/ui/tab_box/home/subscreens/product_detail_screen.dart';
import 'package:paradoxs_coffee/ui/tab_box/tab_box.dart';

class RouteNames {
  static const String homeScreen = "/home";
  static const String onBoarding = "/on_boarding";
  static const String splashScreen = "/";
  static const String tabBox = "/tab_box";
  static const String detailScreen = "/detail_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.detailScreen:
        return MaterialPageRoute(
          builder: (context) =>  ProductDetailScreen(productModel: settings.arguments as ProductModel,),
        );
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) => const TabBox(),
        );
      case RouteNames.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}
