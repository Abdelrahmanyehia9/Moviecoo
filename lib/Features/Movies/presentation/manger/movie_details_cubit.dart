import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviecoo/Features/Movies/data/repos/home_repo.dart';
import 'package:moviecoo/Features/Movies/presentation/manger/movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates>{
  MovieDetailsCubit(this.repo ,) : super(MovieDetailsInitial());
static int? id ;
  final HomeRepo repo ;

  Future<void> fetchData () async {
    emit(MovieDetailsLoading());
    var data = await repo.movieDetails(id.toString()) ;
    data.fold((fail) {
      emit(MovieDetailsFailure(fail.toString()));

    }, (movie) {
      emit(MovieDetailsSuccess(movie));

    });

  }

}