import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../views/HomeView.dart';
import '../../views/LoginView.dart';
import '../../views/ProfileView.dart';
import '../../views/RegisterView.dart';
import 'app_routes.dart';

class AppScreens {
  AppScreens._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: RoutePaths.home,
      page: () => const HomeViewWidget(),
    ),
    GetPage(
      name: RoutePaths.login,
      page: () => const LoginViewWidget(),
    ),
    GetPage(
      name: RoutePaths.register,
      page: () => const RegisterViewWidget(),
    ),
    GetPage(
      name: RoutePaths.profile,
      page: () => const ProfileViewWidget(),
    ),
  ];
}
