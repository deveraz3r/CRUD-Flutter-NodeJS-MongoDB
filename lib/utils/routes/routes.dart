import 'package:crud_mongodb_frontend/utils/app_urls.dart';

class Routes {

  //GetX
  static appRoutes() => [
    GetPage(name: RouteName.home, page: () => HomeView()),
    GetPage(name: RouteName.createEmployee, page: () => CreateEmployeeView()),
    GetPage(name: RouteName.updateEmployee, page: () => UpdateEmployeeView()),
  ];

}