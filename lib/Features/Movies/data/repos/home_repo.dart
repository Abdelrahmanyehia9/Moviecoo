import "package:dartz/dartz.dart";
import 'package:moviecoo/Features/Movies/data/model/MovieDetails.dart';
import 'package:moviecoo/core/error/failure.dart';

import '../model/result.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Result>>> fetchAllMovies();
  Future <Either<Failure , List<Result>>> fetchPopularMovies() ;
  Future <Either<Failure , MovieDetails>> movieDetails(String movieid) ;

}
