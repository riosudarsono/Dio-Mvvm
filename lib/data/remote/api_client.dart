import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("movie/popular")
  Future<String> getProduct();

  @GET("movie/popular")
  Future<String> getProductDetail(String id);

  // @GET("user/get-banner")
  // Future<> banner();
}
