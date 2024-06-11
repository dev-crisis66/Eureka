abstract class Routes {
  Routes._();

  static const login = RoutePaths.login;
  static const register = RoutePaths.register;
  static const password = RoutePaths.password;
  static const profile = RoutePaths.profile;
  static const home = RoutePaths.home;
  static const anonyme = RoutePaths.anonyme;
}

abstract class RoutePaths {
  RoutePaths._();

  static const login = '/login';
  static const home = '/home';
  static const password = '/password';
  static const register = '/register';
  static const profile = '/profile';
  static const anonyme = '/anonyme';
}
