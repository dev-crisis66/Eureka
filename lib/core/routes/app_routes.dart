abstract class Routes {
  Routes._();

  static const login = RoutePaths.login;
  static const register = RoutePaths.register;
  static const password = RoutePaths.password;
  static const profile = RoutePaths.profile;
  static const home = RoutePaths.home;
}

abstract class RoutePaths {
  RoutePaths._();

  static const login = '/login';
  static const home = '/home';
  static const password = '/password';
  static const register = '/register';
  static const profile = '/profile';
}
