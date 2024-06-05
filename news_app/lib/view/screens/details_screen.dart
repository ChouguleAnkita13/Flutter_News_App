import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/newsmodel.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key, required this.detailNews});

  final Data detailNews;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              widget.detailNews.imageUrl!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 2,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.detailNews.title!,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(34, 31, 31, 1),
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Chip(
                          backgroundColor:
                              const Color.fromRGBO(242, 242, 242, 1),
                          label: Text(
                            widget.detailNews.date!,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(34, 31, 31, 1),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.detailNews.content!,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(85, 85, 85, 1),
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Chip(
                            backgroundColor:
                                const Color.fromRGBO(242, 242, 242, 1),
                            label: Text("Author : ${widget.detailNews.author}",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(34, 31, 31, 1),
                                  fontSize: 15,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          margin: const EdgeInsets.all(10),
                          elevation: 15,
                          color: Colors.black12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              InkWell(
                                child: Image.network(
                                  widget.detailNews.imageUrl!,
                                  fit: BoxFit.cover,
                                ),
                                onTap: () async {
                                  await launchUrlString(
                                    mode: LaunchMode.inAppWebView,
                                      widget.detailNews.readMoreUrl!);// Open the news URL in a web view when tapped
                                },
                              ),
                              Text("News Source",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 24,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
