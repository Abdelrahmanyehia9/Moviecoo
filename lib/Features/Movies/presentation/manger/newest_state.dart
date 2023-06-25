import '../../data/model/result.dart';

abstract class NewestState{



} class NewestSuccess extends NewestState{

  final List<Result> movieModel ;

  NewestSuccess(this.movieModel);

}class NewestFailure extends NewestState{

  final String errorMessage ;

  NewestFailure(this.errorMessage);
}
class NewestLoading extends NewestState{}
class NewestInitial extends NewestState{}