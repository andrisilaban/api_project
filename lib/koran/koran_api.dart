import 'dart:convert';

import 'package:http/http.dart';
import 'package:rest_api_300721/koran/article.dart';

class KoranApi {
  final url = 'https://run.mocky.io/v3/cd4eaeba-7c80-492a-a92a-d9107b083600';

  Future <List<Article>> getKoranApi() async{
    final response = await get(Uri.https('run.mocky.io', 'v3/cd4eaeba-7c80-492a-a92a-d9107b083600'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articlesku = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articlesku;
    }else {
      throw ('Cant get article');
    }
  }
}