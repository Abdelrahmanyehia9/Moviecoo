import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moviecoo/core/utils/Api_Helper.dart';

import '../../Features/Movies/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(ApiHelper(Dio()))) ;
}
