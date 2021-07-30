import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myarch/core/components/view/notfoundview.dart';
import 'package:myarch/core/constant/navigationconstant.dart';
import 'package:myarch/features/home/view/homeview.dart';
import 'package:myarch/features/login/loginview.dart';
import 'package:myarch/features/splash/view/splashview.dart';
import 'package:myarch/features/traveldetails/view/traveldetails.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(SplashView());

      case NavigationConstants.LOGIN:
        return normalNavigate(LoginView());

      case NavigationConstants.HOME:
        return normalNavigate(HomeView());

      case NavigationConstants.TRAVEL_DETAIL:
        return normalNavigate(TravelDetails());
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
