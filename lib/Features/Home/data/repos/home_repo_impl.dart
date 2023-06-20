import 'package:dartz/dartz.dart';

import 'package:moviecoo/Features/Home/data/model/movie_model.dart';
import 'package:moviecoo/constants.dart';
import 'package:moviecoo/core/error/failure.dart';
import 'package:moviecoo/core/utils/Api_Helper.dart';


import 'home_repo.dart';
import 'package:dio/dio.dart';
class HomeRepoImpl implements HomeRepo{
  final ApiHelper apiHelper ;

  HomeRepoImpl(this.apiHelper); 
  @override
  Future<Either<Failure, List<MovieModel>>> fetchAllMovies() async{
    try{
      var data = await   apiHelper.get(endPoint: "discover/movie?api_key=$apiKey");
      List<MovieModel> movie = [];
      for (var item in data["results"]){
try {
  movie.add(MovieModel.fromJson(item)) ;
} catch (e){

  movie.add(MovieModel.fromJson(item)) ;

}     }
     
        
      return right(movie) ;

    }catch (e){
if (e is DioException){
  return left(ServerFailure.fromDioerror(e)) ;
}
else {
return left(ServerFailure(e.toString()));
}


    }


  }









}