

import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/api/api_helper.dart';

class ApiHelperImpl implements ApiHelper{
  ApiHelperImpl._privateConstructor();

  static ApiHelperImpl INSTANCE = ApiHelperImpl._privateConstructor();
  //ipconfig
  //ifconfig
  final _dio = Dio(BaseOptions(baseUrl: 'http://10.10.50.27:9090'));

  Future<dynamic> postData(String path, Map<String, dynamic> data) async{
    try {
      Response response = await _dio.post(path, data: data);
      if(response.statusCode == 200 || response.statusCode == 201){
        return response.data;
      }else{
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print(e);
      throw Exception('Could not connect');
    }
  }

  Future<dynamic> getData(String path, {Map<String, dynamic>? queryParameter})async{
    try {
      Response response = await _dio.get(path, queryParameters: queryParameter);
      if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Could not connect');
    }
  }


}