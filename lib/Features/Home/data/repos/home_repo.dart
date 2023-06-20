import 'package:moviecoo/Features/Home/data/model/movie_model.dart';
import"package:dartz/dartz.dart" ;
import 'package:moviecoo/core/error/failure.dart';
abstract class HomeRepo {
Future<Either< Failure,List<MovieModel> >>fetchAllMovies() ;


}