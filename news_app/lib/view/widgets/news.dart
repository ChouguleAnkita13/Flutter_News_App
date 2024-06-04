import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/newsmodel.dart';
import 'package:news_app/view/screens/details_screen.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class News extends StatefulWidget {
  const News({super.key, required this.newsData});
  final List<Data> newsData;

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final _controller = PageController(initialPage: 0);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(242, 242, 242, 1),
      ),
      child: PageView.builder(
        controller: _controller,
        onPageChanged: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        itemCount: widget.newsData.length,
        itemBuilder: (context, pageIndex) {
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetailsScreen(detailNews:widget.newsData[pageIndex])));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.newsData[pageIndex].imageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.45,
                ),
                const SizedBox(height: 30),
                Text(
                  widget.newsData[pageIndex].title!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(34, 31, 31, 1),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.newsData[pageIndex].date!,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(34, 31, 31, 0.4),
                        fontSize: 13,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_border,
                          size: 24,
                          color:  Color.fromRGBO(34, 31, 31, 0.4),
                        ))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
