import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:news_app/model/newsmodel.dart';

// Function to fetch news data from the API based on the specified category

Future<List<Data>> getNews(String category)async{
  Uri url=Uri.parse("https://inshortsapi.vercel.app/news?category=$category");

  http.Response response =await http.get(url);

  Map<String,dynamic> responseData=json.decode(response.body);

  NewsModel newsModel=NewsModel(responseData);
  log("${newsModel.category}");

  return newsModel.data!;
}