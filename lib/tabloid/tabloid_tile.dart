import 'package:flutter/material.dart';
import 'package:rest_api_300721/tabloid/tabloid_articles.dart';
import 'package:rest_api_300721/tabloid/tabloid_page.dart';

Widget TabloidTile(BuildContext context, TabloidArticle tabloidArticle) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TabloidPage(tabloidArticle: tabloidArticle)));
    },
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 9.0)],
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(tabloidArticle.urlToImage),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Text(
              tabloidArticle.title,
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.amber, Colors.amberAccent],
                    begin: Alignment.center)),
          ),
          SizedBox(height: 10,),
          Text(tabloidArticle.title),
        ],
      ),
    ),
  );
}
