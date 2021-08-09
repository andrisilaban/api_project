import 'package:flutter/material.dart';
import 'package:rest_api_300721/article/api_service.dart';
import 'package:rest_api_300721/article/article.dart';

class ArticleMain extends StatefulWidget {
  const ArticleMain({Key? key}) : super(key: key);

  @override
  _ArticleMainState createState() => _ArticleMainState();
}

class _ArticleMainState extends State<ArticleMain> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            var articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Card(child: Text(snapshot.data![index].title)),),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
