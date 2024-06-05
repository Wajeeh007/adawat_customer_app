import 'package:adawat_customer_app/screens/splash/splash_view.dart';
import 'package:get/get.dart';

class AppRoutes {

  static const initRoute = '/';

  List<GetPage> getRoutes() {
    return [
      GetPage(name: initRoute, page: () => const SplashView())
    ];
  }
}