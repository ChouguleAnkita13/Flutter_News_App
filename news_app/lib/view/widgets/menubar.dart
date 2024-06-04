import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controller/getnews.dart';
import 'package:news_app/model/newsmodel.dart';
import 'package:news_app/view/widgets/news.dart';

class CategoryMenuBar extends StatefulWidget {
  const CategoryMenuBar({super.key});

  @override
  State<CategoryMenuBar> createState() => _CategoryMenuBarState();
}

class _CategoryMenuBarState extends State<CategoryMenuBar> {
  String selectedCategory = 'National';
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
  List<Data> newsData = [];

  @override
  void initState() {
    super.initState();
    getAllNews();
  }

  void getAllNews() async {
    newsData = await getNews(selectedCategory.toLowerCase());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              return GestureDetector(
                onTap: () {
                  setState(() async {
                    selectedCategory = category;
                    getAllNews();
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: selectedCategory == category
                            ? const Color.fromRGBO(255, 179, 182, 1)
                            : const Color.fromRGBO(240, 241, 250, 1),
                      ),
                      gradient: selectedCategory == category
                          ? const LinearGradient(
                              colors: [
                                  Color.fromRGBO(255, 128, 134, 1),
                                  Color.fromRGBO(255, 58, 68, 1),
                                ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          : const LinearGradient(colors: [
                              Color.fromRGBO(255, 255, 255, 1),
                              Color.fromRGBO(255, 255, 255, 1),
                            ])),
                  child: Text(
                    category,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: selectedCategory == category
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        News(newsData: newsData)
      ],
    );
  }
}
