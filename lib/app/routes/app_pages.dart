import 'package:get/get.dart';

import '../modules/buku/bindings/buku_binding.dart';
import '../modules/buku/views/buku_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/controllers/home_controller.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/controllers/login_controller.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/controllers/register_controller.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: BindingsBuilder(() {
        Get.put(RegisterController());
      }),
      children: [
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: RegisterBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BUKU,
      page: () => const BukuView(),
      binding: BukuBinding(),
    ),
  ];
}
