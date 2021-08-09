import 'dart:convert';

import 'package:http/http.dart';
import 'package:rest_api_300721/tabloid/tabloid_articles.dart';

class TabloidApi {
  final url = 'https://run.mocky.io/v3/cd4eaeba-7c80-492a-a92a-d9107b083600';

  Future<List<TabloidArticle>> getTabloidApi() async {
    final response = await get(
        Uri.https('run.mocky.io', 'v3/cd4eaeba-7c80-492a-a92a-d9107b083600'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<TabloidArticle> articles =
          body.map((dynamic item) => TabloidArticle.fromJson(item)).toList();
      return articles;
    } else {
      throw ('No Data Bro');
    }
  }
}
