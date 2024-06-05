import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/controller/getnews.dart';
import 'package:news_app/model/newsmodel.dart';

class NewsProvider with ChangeNotifier {
  String _selectedCategory = 'National';
  List<Data> _newsData = [];
  final List<Data> _bookmarkedNews = [];
  bool _isLoading = false;

  // List of categories available for selection.
  List<String> categories = [
    'All',
    'National',
    'Business',
    'Sports',
    'World',
    'Politics',
    'Technology',
    'Startup',
    'Entertainment',
    'Miscellaneous',
    'Hatke',
    'Science',
    'Automobile',
  ];

  // Constructor to fetch news data for the "National" category when the NewsProvider is initialized.
  NewsProvider() {
    getAllNews();
  }

  // Getters for accessing private variables.
  String get selectedCategory => _selectedCategory;
  List<Data> get newsData => _newsData;
  List<Data> get bookmarkedNews => _bookmarkedNews;
  bool get isLoading => _isLoading;

  // Method to set the selected category and fetch news data accordingly.
  void setSelectedCategory(String category) {
    _selectedCategory = category;
    getAllNews();
  }

  // Asynchronous method to fetch news data based on the selected category.
  Future<void> getAllNews() async {
    _isLoading = true;
    notifyListeners();

    try {
      _newsData = await getNews(_selectedCategory.toLowerCase());
    } catch (e) {
      log('Error fetching news: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Method to toggle the bookmark status of an article.
  void toggleBookmark(Data article) {
    if (_bookmarkedNews.contains(article)) {
      _bookmarkedNews.remove(article);
    } else {
      _bookmarkedNews.add(article);
    }
    notifyListeners();
  }

  // Method to check if an article is bookmarked.
  bool isBookmarked(Data article) {
    return _bookmarkedNews.contains(article);
  }
}
