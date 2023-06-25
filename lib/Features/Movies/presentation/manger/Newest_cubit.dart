import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/home_repo.dart';
import 'newest_state.dart';


class NewestMovieCubit extends Cubit< NewestState>{
  NewestMovieCubit(this.repo) : super(NewestInitial());
  final HomeRepo repo   ;
 Future<void> fetchData()async{
   emit(NewestLoading())  ;

     var data = await repo.fetchPopularMovies() ;
     data.fold((l) => emit(NewestFailure(l.toString())), (r) => emit(NewestSuccess(r))) ;






 }
  }


