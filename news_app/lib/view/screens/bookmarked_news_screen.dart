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
        leading: Image.asset(
          "assets/images/logo.png",
          height: 20,
          width: 20,
        ),
        title: Text(
          'Bookmarked News',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            color: const Color.fromRGBO(0, 0, 0, 1),
            fontSize: 20,
          ),
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
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No bookmarked news',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                   GestureDetector(
                    onTap: (){
                          Navigator.of(context).pushNamed("/home");
                        },
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 128, 134, 1),
                            Color.fromRGBO(255, 58, 68, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset:
                                const Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        'Back to News',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
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
                          news.imageUrl!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 150,
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
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      news.author ?? 'Unknown',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      news.date!,
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
