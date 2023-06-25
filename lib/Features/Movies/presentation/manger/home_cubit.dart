import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviecoo/Features/Movies/data/repos/home_repo.dart';

import 'home_states.dart';


class AllMovieCubit extends Cubit<HomeState> {
  AllMovieCubit(this.repo) : super(HomeInitial());
  final HomeRepo repo;

  Future<void> fetchData() async {
    emit(HomeLoading());
    var data = await repo.fetchAllMovies();
    data.fold(
      (fail) {
        emit(HomeFailure(fail.toString()));
      },
      (movie) {
        emit(HomeSuccess(movie));
      },
    );
  }
}
