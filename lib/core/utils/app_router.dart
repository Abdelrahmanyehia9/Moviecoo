import 'package:go_router/go_router.dart';
import 'package:moviecoo/Features/Home/presentation/view/home_view.dart';
import 'package:moviecoo/Features/Splash/presentation/view/splash_view.dart';

class AppRouter{
static String homePage = "/Homepage"  ;
  static final route = GoRouter(routes: [
GoRoute(path: '/' , builder: (context , state )=> const SplashView()) ,
GoRoute(path: homePage , builder: (context , state)=> const HomeView()) ,

  ]);




}