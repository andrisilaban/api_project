import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_300721/passenger/passenger_model.dart';

class PassengersApi {
  final url = 'https://api.instantwebtools.net/v1/passenger?page=0&size=10';

  Future getPassengersApi() async {
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<PassengersModel> passengersModel =
            it.map((e) => PassengersModel.fromJson(e)).toList();
        return passengersModel;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
