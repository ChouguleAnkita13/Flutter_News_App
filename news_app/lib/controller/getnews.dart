import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/model/newsmodel.dart';
 List<Data> newsData=[];

void getnews(String category)async{
  Uri url=Uri.parse("https://inshortsapi.vercel.app/news?category=$category");

  http.Response response =await http.get(url);

  Map<String,dynamic> responseData=json.decode(response.body);

  NewsModel newsModel=NewsModel(responseData);
  log("${newsModel.category}");

  newsData=newsModel.data!;
}