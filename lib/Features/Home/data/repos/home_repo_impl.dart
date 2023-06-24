import 'package:dartz/dartz.dart';

import 'package:moviecoo/Features/Home/data/model/movie_model.dart';
import 'package:moviecoo/Features/Home/data/model/result.dart';
import 'package:moviecoo/constants.dart';
import 'package:moviecoo/core/error/failure.dart';
import 'package:moviecoo/core/utils/Api_Helper.dart';

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
}
