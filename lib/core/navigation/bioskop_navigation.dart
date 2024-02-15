import 'package:flutter/material.dart';
import 'package:flutter_bioskop/screens/auth/login_screen.dart';
import 'package:flutter_bioskop/screens/auth/register_screen.dart';
import 'package:flutter_bioskop/screens/content/buy_ticket_screen.dart';
import 'package:flutter_bioskop/screens/content/choose_seat_screen.dart';
import 'package:flutter_bioskop/screens/content/detail_content_screen.dart';
import 'package:flutter_bioskop/screens/content/directory_movie_screen.dart';
import 'package:flutter_bioskop/screens/menu/home_screen.dart';
import 'package:flutter_bioskop/screens/menu/profile_screen.dart';
import 'package:flutter_bioskop/screens/splash_screen.dart';

class BioskopNavigation {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Register route
  static Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    RegisterScreen.routeName: (context) => const RegisterScreen(),
    MainScreen.routeName: (context) => const MainScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    ProfileScreen.routeName: (context) => const ProfileScreen(),
    DirectoryMovieScreen.routeName: (context) => const DirectoryMovieScreen(),
    DetailContentScreen.routeName: (context) => const DetailContentScreen(),
    BuyTicketScreen.routeName: (context) => const BuyTicketScreen(),
    ChooseSeatScreen.routeName: (context) => const ChooseSeatScreen(),
  };

  void pushNamed(String routeName, {Object? arguments}) {
    navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void push(Widget widget) {
    navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  void pop() {
    navigatorKey.currentState!.pop();
  }

  void popUntil(String routeName) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }
}
