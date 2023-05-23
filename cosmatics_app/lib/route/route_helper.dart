import 'package:get/get.dart';

import '../pages/home/main_cosmatics_page.dart';

class RouteHelper{
  static const String initial='/';

  static List<GetPage> route=[
    GetPage(name: initial, page:(() => MainCosmaticPage()))
  ];
}