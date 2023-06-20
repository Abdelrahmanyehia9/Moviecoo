

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviecoo/Features/Home/data/repos/home_repo.dart';
import 'package:moviecoo/Features/Home/data/repos/home_repo_impl.dart';
import 'package:moviecoo/Features/Home/presentation/manger/home_cubit.dart';
import 'package:moviecoo/Features/Splash/presentation/widget/splash_view_body.dart';
import 'package:moviecoo/core/utils/Api_Helper.dart';
import 'package:moviecoo/core/utils/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  
  
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3),(){
      GoRouter.of(context).push(AppRouter.homePage) ;
    })
;  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}

