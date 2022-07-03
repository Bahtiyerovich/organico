import 'package:dio/dio.dart';
import 'package:organico/models/api_model.dart';


class ApiService {
  static Future<List<OrganicoApiModel>> getData() async {
    Response res = await Dio().get("http://192.168.43.19:8080/api");
    return (res.data as List).map((e) => OrganicoApiModel.fromJson(e)).toList();
  }
}
