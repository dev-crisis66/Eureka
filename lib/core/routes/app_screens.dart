import 'package:get/get.dart';
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
      page: () => const HomeView(),
    ),
    GetPage(
      name: RoutePaths.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: RoutePaths.register,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: RoutePaths.profile,
      page: () => const ProfileView(),
    ),
  ];
}
