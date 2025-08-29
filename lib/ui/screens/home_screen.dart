import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/models/article_model.dart';
import 'package:todoapp/core/repository/article_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  ArticleRepository repository = ArticleRepository();

  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 24,
        title: Image.asset(
          'assets/images/logo.png',
          height: 30,
          width: 99,
        ),
        actions: [
          Container(
              padding: EdgeInsets.all(7),
              margin: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.notifications),
              )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff1877F2),
        showUnselectedLabels: true,
        unselectedItemColor: Color(0xff4E4B66),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: 'Bookmark'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //search
            Container(
              height: 48,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Color(0xff4E4B66),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Color(0xff4E4B66),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                    ),
                  ),
                  Image.asset(
                    'assets/icons/search.png',
                    height: 20,
                    width: 20,
                    color: Color(0xff4E4B66),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            //main item
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Image.asset(
            //         'assets/images/news.png',
            //         width: double.infinity,
            //         height: 183,
            //       ),
            //       SizedBox(height: 8),
            //       Text(
            //         'Europe',
            //         style: TextStyle(
            //           fontSize: 13,
            //           color: Color(0xff4E4B66),
            //         ),
            //       ),
            //       SizedBox(height: 4),
            //       Text(
            //         'Russian warship: Moskva sinks in Black Sea',
            //         style: TextStyle(fontSize: 16),
            //       ),
            //       SizedBox(height: 4),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               Image.asset(
            //                 'assets/icons/bbc.png',
            //                 height: 20,
            //                 width: 20,
            //               ),
            //               SizedBox(width: 4),
            //               Text('BBC News'),
            //               SizedBox(width: 12),
            //               Icon(
            //                 Icons.access_time,
            //                 size: 20,
            //               ),
            //               SizedBox(width: 4),
            //               Text('4h ago')
            //             ],
            //           ),
            //           Icon(
            //             Icons.more_horiz,
            //             size: 20,
            //           )
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Latest',
            //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            //       ),
            //       Text(
            //         'See all',
            //         style: TextStyle(fontSize: 14),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            // TabBar(controller: tabController, isScrollable: true, tabs: [
            //   Tab(text: 'All'),
            //   Tab(text: 'Sports'),
            //   Tab(text: 'Politics'),
            //   Tab(text: 'Bussines'),
            //   Tab(text: 'Health'),
            //   Tab(text: 'Travel'),
            // ]),
            SizedBox(height: 16),

            FutureBuilder(
                future: repository.getArticles(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    log('snapshot IS ${snapshot.data}');
                    ArticleModel model = snapshot.data!;
                    return ListView.builder(
                      itemCount: model.totalResults,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        Article article = model.articles[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.red,
                                child: Image.network(
                                  article.urlToImage,
                                  fit: BoxFit.cover,
                                  height: 96,
                                  width: 96,
                                ),
                              ),
                              SizedBox(width: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.6),
                                    child: Text(
                                      article.title,
                                      style: TextStyle(fontSize: 16),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 120),
                                            child: Text(
                                              article.author,
                                              maxLines: 1,
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Icon(
                                            Icons.access_time,
                                            size: 20,
                                          ),
                                          SizedBox(width: 4),
                                          Text(DateFormat('MMMM d,y')
                                              .format(article.publishedAt))
                                          // Text(article.publishedAt.toString())
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return CircularProgressIndicator();
                }),
            //news item
          ],
        ),
      ),
    );
  }
}
