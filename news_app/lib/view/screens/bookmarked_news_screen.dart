import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';  // Import the app theme
import 'package:news_app/controller/news_provider.dart';
import 'package:news_app/view/screens/details_screen.dart';
import 'package:provider/provider.dart';
import 'dart:ui'; // Import dart:ui for BackdropFilter

class BookmarkedNewsScreen extends StatelessWidget {
  const BookmarkedNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the NewsProvider using Provider.of
    final newsProvider = Provider.of<NewsProvider>(context);
    // Get the list of bookmarked news
    final bookmarkedNews = newsProvider.bookmarkedNews;

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo.png",
          height: 20,
          width: 20,
        ),
        title: Text(
          'Bookmarked News',
          style: AppTheme.lightTheme.textTheme.titleLarge, // Use the theme's text style
        ),
        automaticallyImplyLeading: false,
      ),
      body: bookmarkedNews.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.bookmark_outline,
                    size: 60,
                    color: AppTheme.textColorLight, // Use the theme's text color
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No bookmarked news',
                    style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                      color: AppTheme.textColorLight, // Use the theme's text style
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/home");
                    },
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: AppTheme.primaryGradient, // Use the theme's gradient
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        'Back to News',
                        style: AppTheme.lightTheme.textTheme.labelLarge, // Use the theme's text style
                      ),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: bookmarkedNews.length,
              itemBuilder: (context, index) {
                final news = bookmarkedNews[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsScreen(detailNews: news),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          news.imageUrl!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                            child: Container(
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          bottom: 0,
                          right: 1,
                          left: 1,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  news.title!,
                                  style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16
                                  ), // Use the theme's text style
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      news.author ?? 'Unknown',
                                      style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                                        color: Colors.white70,
                                        fontSize: 14
                                      ), // Use the theme's text style
                                    ),
                                    Text(
                                      news.date!,
                                      style:AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                                        color: Colors.white70,
                                        fontSize: 14
                                      ),  // Use the theme's text style
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
