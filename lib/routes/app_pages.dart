import 'package:childappadminpanel/bindings/main_bingings.dart';
import 'package:childappadminpanel/view/page/all_study_phase.dart';
import 'package:get/get.dart';

import '../view/page/main_page.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.MainScreen,
      page: () => MainScreen(),
      binding: MainBindings(),
    ),
  ];
}
//Age Calculator Made By Mohamed Ahmed