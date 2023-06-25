import 'package:go_router/go_router.dart';
import 'package:moviecoo/Features/Movies/data/model/MovieDetails.dart';
import 'package:moviecoo/Features/Splash/presentation/view/splash_view.dart';


import '../../Features/Movies/presentation/view/home_view.dart';
import '../../Features/Movies/presentation/view/streaminvy_review.dart';
import '../../Features/Movies/presentation/view/watch_movie.dart';

class AppRouter{
static String homePage = "/Homepage"  ;
static String streamReview = '/StreamReview' ;
static String movieDetails = '/movieDetails' ;

   static final route = GoRouter(routes: [
GoRoute(path: '/' , builder: (context , state )=>  SplashView()) ,
GoRoute(path: homePage , builder: (context , state)=> const HomeView()) ,
    GoRoute(path: streamReview , builder: (context , state)=>  StreamReview()) ,
     GoRoute(path: movieDetails , builder: (context , state)=>  const WatchMovie()) ,

  ]);




}