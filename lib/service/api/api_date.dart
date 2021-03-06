import 'package:dio/dio.dart';
import 'package:organico/models/api_model.dart';

class ApiService {
  static Future<List<OrganicoApiModel>> getData() async {
    // Response res = await Dio().get("http://192.168.1.103:8080/api");
    Response res = await Dio().get("http://192.168.111.99:8080/api");

    return (res.data as List).map((e) => OrganicoApiModel.fromJson(e)).toList();
  }
}
