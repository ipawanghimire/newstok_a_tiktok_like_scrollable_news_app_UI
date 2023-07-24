import 'package:flutter/material.dart';
import 'package:newstok/model/data.dart';
import 'package:newstok/screen/widget/common/drawer.dart';
import 'package:newstok/screen/widget/news_carousel.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      drawer: AppDrawer(),
      body: NewsCarousel(newsItems: newsItems),
    );
  }
}
