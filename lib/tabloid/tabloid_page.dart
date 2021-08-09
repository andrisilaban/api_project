import 'package:flutter/material.dart';
import 'package:rest_api_300721/tabloid/tabloid_articles.dart';

class TabloidPage extends StatelessWidget {
  final TabloidArticle tabloidArticle;

  TabloidPage({required this.tabloidArticle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: Text(tabloidArticle.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(tabloidArticle.urlToImage))),
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              child: Text(tabloidArticle.title,
                  style: TextStyle(color: Colors.red)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                tabloidArticle.description,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
