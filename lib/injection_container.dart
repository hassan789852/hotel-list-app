import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_list_app/screen/venue_list_screen/controller/venue_list_screen_controller.dart';
import 'package:hotel_list_app/screen/venue_list_screen_filter/controller/venue_list_filter_controller.dart';
import 'package:hotel_list_app/services/deep_link_service.dart';


import 'core/base_dio/base_dio.dart';
import 'core/constant/constant.dart';

final sl = GetIt.instance;

class InjectionContainer {
  InjectionContainer._();
  static Future<void> initializeDependencies() async {

    final dio = Dio(BaseOptions(baseUrl: Constant.baseUrl));
    sl.registerLazySingleton(() => BaseDio(dioProject: dio));

    sl.registerSingleton(venueListFilterControllerProvider);
    sl.registerSingleton(venueListScreenControllerProvider);
    sl.registerLazySingleton(() => DeepLinkService());


  }
}
