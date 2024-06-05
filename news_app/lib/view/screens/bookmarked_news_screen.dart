import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text(
          'Bookmarked News', 
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            color: const Color.fromRGBO(0, 0, 0, 1),
            fontSize: 20,
          ),
        ),
      ),
      body: bookmarkedNews.isEmpty // Show different UI based on whether there are bookmarked news or not
          ? Center(
              child: Text(
                'No bookmarked news', 
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                  fontSize: 18,
                ),
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
                        builder: (context) =>
                            NewsDetailsScreen(detailNews: news), 
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
                          news.imageUrl!, // Display the news image
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 150,
                        ),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), // Apply blur effect to the image
                            child: Container(
                              color: Colors.black.withOpacity(0.1), // Background color for the blurred area
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
                                  Colors.black.withOpacity(0.6), // Gradient color for text background
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
                                  news.title!, // Display the news title
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  maxLines: 2, 
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      news.author ?? 'Unknown', // Display the news author or 'Unknown' if author is null
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      news.date!, // Display the news date
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
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
