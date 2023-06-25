import 'package:dartz/dartz.dart';
import 'package:moviecoo/Features/Movies/data/model/MovieDetails.dart';

import 'package:moviecoo/constants.dart';
import 'package:moviecoo/core/error/failure.dart';
import 'package:moviecoo/core/utils/Api_Helper.dart';

import '../model/movie_model.dart';
import '../model/result.dart';
import 'home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiHelper apiHelper;

  HomeRepoImpl(this.apiHelper);
  @override
  Future<Either<Failure, List<Result>>> fetchAllMovies() async {
    try {
      Map<String, dynamic> data = await apiHelper.get(endPoint: "discover/movie?api_key=$apiKey");
      final movies = MovieModel.fromJson(data);
      List<Result> moviesList = [];
      if (movies.results != null) {
        for (var item in movies.results!) {
          moviesList.add(item);
        }
      }
      return right(moviesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioerror(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  Future<Either<Failure, List<Result>>> fetchPopular() async {
    try {
      Map<String, dynamic> data = await apiHelper.get(endPoint: "movie/popular?api_key=$apiKey");
      final movies = MovieModel.fromJson(data);
      List<Result> moviesList = [];
      if (movies.results != null) {
        for (var item in movies.results!) {
          moviesList.add(item);
        }
      }
      return right(moviesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioerror(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Result>>> fetchPopularMovies() async{
    try {
      Map<String, dynamic> data = await apiHelper.get(endPoint: "movie/top_rated?api_key=$apiKey");
      final movies = MovieModel.fromJson(data);
      List<Result> moviesList = [];
      if (movies.results != null) {
        for (var item in movies.results!) {
          moviesList.add(item);
        }
      }
      return right(moviesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioerror(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
}

  @override
  Future<Either<Failure, MovieDetails>> movieDetails(String movieid) async{
  try{
    Map<String , dynamic> data = await apiHelper.get(endPoint: "/movie/$movieid?api_key=$apiKey");
 final movie = MovieDetails.fromJson(data) ;


 return right(movie) ;

  }catch(e){
    if(e is DioException){
      return left(ServerFailure.fromDioerror(e));
    }
    else{
      return left(ServerFailure(e.toString()));
    }

  }


  }}
