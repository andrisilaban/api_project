import 'package:flutter/material.dart';
import 'package:rest_api_300721/koran/article.dart';

Widget customListTile(Article article) {
  return Container(
    margin: EdgeInsets.all(12),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.red, blurRadius: 3.0)]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(article.url)),
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
          child: Text(article.source.name),
        ),
        SizedBox(height: 8.0),
        Text(
          article.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    ),
  );
}
