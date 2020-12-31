import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:peruvian_identifier/models/Company.dart';

class CompanyRepository {

  final Dio _dio = new Dio();

  final String _base_url = "https://dni.optimizeperu.com/api/company/";

  Future<Company> getByRUC({@required String ruc}) async {
    try {
      print("Paso por Repository ${ruc}");

      String url = "${_base_url}${ruc}?format=json";

      Response response = await _dio.get(url);
      print(response);
      return Company.fromJSON(response.data);
    } catch (e) {
      print("ERROR");
      print(e);
    }
  }
}
