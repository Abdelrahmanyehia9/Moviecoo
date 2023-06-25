import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviecoo/Features/Movies/presentation/manger/movie_details_cubit.dart';

import 'package:moviecoo/constants.dart';
import 'package:moviecoo/core/utils/app_router.dart';
import 'package:moviecoo/core/utils/service_locator.dart';

import 'Features/Movies/data/repos/home_repo_impl.dart';
import 'Features/Movies/presentation/manger/Newest_cubit.dart';
import 'Features/Movies/presentation/manger/home_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllMovieCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchData(),
        ),
        BlocProvider(create: (context) => NewestMovieCubit(getIt.get<HomeRepoImpl>())..fetchData()) ,
        BlocProvider(create: (context)=> MovieDetailsCubit(getIt.get<HomeRepoImpl>()))
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.route,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: mainColor,
          )),
    );
  }
}
