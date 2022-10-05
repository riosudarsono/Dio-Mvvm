import 'package:flutter/material.dart';

abstract class RemoteDataSource {
  Future<String> getProduct();
  Future<String> getProductDetail(String id);
}
