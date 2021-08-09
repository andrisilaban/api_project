import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_300721/post/post_model.dart';

class PostApi {
  final url = 'https://jsonplaceholder.typicode.com/posts';
  Future getPostApi() async{
    final response = await http.get(Uri.parse(url));
    try {
      if(response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<PostsModel> postsModel = it.map((e) => PostsModel.fromJson(e)).toList();
        return postsModel;
      }
    } catch(e) {
      print(e.toString());
    }
  }

}