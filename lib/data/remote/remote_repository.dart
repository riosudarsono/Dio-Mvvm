import 'package:dio/dio.dart';
import 'package:dio_mvvm/data/remote/api_client.dart';
import 'package:dio_mvvm/data/remote/remote_data_source.dart';

class RemoteRepository extends RemoteDataSource {
  Dio _dio = Dio();
  late ApiClient _apiClient;

  RemoteRepository() {
    _dio = Dio();
    _apiClient = ApiClient(_dio);
  }

  @override
  Future<String> getProduct() {
    return _apiClient.getProduct();
  }

  @override
  Future<String> getProductDetail(String id) {
    return _apiClient.getProductDetail(id);
  }
}
