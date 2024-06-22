import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:news_app/view/screens/details_screen.dart';
import 'package:news_app/controller/news_provider.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.44,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(242, 242, 242, 1),
          ),
          child: PageView.builder(
            itemCount: newsProvider.newsData
                .length, // Number of items in the PageView is determined by the length of newsData list in NewsProvider.
            itemBuilder: (context, pageIndex) {
              final article = newsProvider
                  .newsData[pageIndex]; // Get the article at the current index.
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewsDetailsScreen(
                      detailNews: article,
                    ),
                  ));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Display the article image with network image.
                    Image.network(
                      article.imageUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2.45,
                    ),
                    const SizedBox(height: 30),
                    // Display the title of the article.
                    Text(
                      article.title!,
                      style: AppTheme.lightTheme.textTheme.titleLarge
                          ?.copyWith(fontSize: 18, color: AppTheme.textColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Display the date of the article.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          article.date!,
                          style: AppTheme.lightTheme.textTheme.titleMedium
                              ?.copyWith(
                            fontSize: 13,
                          ),
                        ),
                        // Display bookmark icon, toggle the bookmark status when tapped.
                        IconButton(
                          onPressed: () {
                            newsProvider.toggleBookmark(article);
                          },
                          icon: Icon(
                            newsProvider.isBookmarked(article)
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            size: 24,
                            color: newsProvider.isBookmarked(article)
                                ? const Color.fromRGBO(34, 31, 31, 1)
                                : const Color.fromRGBO(34, 31, 31, 0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
