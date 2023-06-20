import 'package:dio/dio.dart';

abstract class Failure{


}
class ServerFailure extends Failure {
final String message ;
ServerFailure(this.message);


factory ServerFailure.fromDioerror(DioException error ){
  switch(error.type){

    case DioExceptionType.connectionTimeout:
   return ServerFailure('Connection Timeout , Please Try Again Later') ;
    case DioExceptionType.sendTimeout:
      return ServerFailure('Send Timeout , Please Try Again Later') ;

    case DioExceptionType.receiveTimeout:
      return ServerFailure('receive Timeout , Please Try Again Later') ;

    case DioExceptionType.badResponse:
return ServerFailure(error.response!.statusMessage.toString()) ;
    case DioExceptionType.cancel:
      return ServerFailure('Your Request had been Cancelled , Please Try Again Later') ;

    case DioExceptionType.connectionError:
      return ServerFailure('connection error, Please Try Again Later') ;

    default:
      return ServerFailure('Something went wrong please Try again ') ;

  }


  }









}