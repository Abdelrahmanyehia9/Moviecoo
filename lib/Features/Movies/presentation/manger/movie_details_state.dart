import 'package:moviecoo/Features/Movies/data/model/MovieDetails.dart';

abstract class MovieDetailsStates{}

class MovieDetailsInitial extends MovieDetailsStates{}
class MovieDetailsSuccess extends MovieDetailsStates{
  final MovieDetails movie ;

  MovieDetailsSuccess(this.movie);
}
class MovieDetailsLoading extends MovieDetailsStates{}
class MovieDetailsFailure extends MovieDetailsStates{


 final  String errorMessage ;

  MovieDetailsFailure(this.errorMessage);
}