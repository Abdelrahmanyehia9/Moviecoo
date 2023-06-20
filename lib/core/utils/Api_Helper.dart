import "package:dio/dio.dart" ;

class ApiHelper {


 final  String _baseUrl = "https://api.themoviedb.org/3/" ;
 final Dio _dio;

 ApiHelper(this._dio);

 Future<Map<String, dynamic>> get({required String endPoint}) async {
  var response = await _dio.get('$_baseUrl$endPoint');
  return response.data;
 }
}


