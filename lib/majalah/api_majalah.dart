import 'dart:convert';

import 'package:http/http.dart';
import 'package:rest_api_300721/majalah/article_majalah.dart';

class ApiMajalah {
  final url = 'https://run.mocky.io/v3/cd4eaeba-7c80-492a-a92a-d9107b083600';

  Future<List<ArticleMajalah>> getApiMajalah() async {
    final response = await get(
        Uri.https('run.mocky.io', 'v3/cd4eaeba-7c80-492a-a92a-d9107b083600'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<ArticleMajalah> articles =
          body.map((dynamic item) => ArticleMajalah.fromJson(item)).toList();
      return articles;
    }else {
      throw ('Cannot Fecth Data');
    }
  }
}
