import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:peruvian_identifier/models/Person.dart';

class PersonRepository {
  final Dio _dio = new Dio();
  final String base_url = "https://dni.optimizeperu.com/api/persons/";

  Future<Person> getByDni({@required String dni}) async {
   try{
     print("Paso por Repository ${dni}");

     String url = "${base_url}${dni}?format=json";

     Response response = await _dio.get(url);
     return Person.fromJson(response.data);
   }catch(e){
     print(e);
   }
  }
}
