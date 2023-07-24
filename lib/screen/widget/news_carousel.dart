import 'package:flutter/material.dart';
import 'package:newstok/model/data.dart';
import 'package:newstok/screen/widget/news_card.dart';

class NewsCarousel extends StatefulWidget {
  final List<NewsItem> newsItems;

  NewsCarousel({required this.newsItems});

  @override
  _NewsCarouselState createState() => _NewsCarouselState();
}

class _NewsCarouselState extends State<NewsCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: widget.newsItems.length,
            scrollDirection: Axis.vertical,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return NewsCard(widget.newsItems[index]);
            },
          ),
        ),
        // SizedBox(height: 16),
        // Text('${currentIndex + 1}/${widget.newsItems.length}'),
      ],
    );
  }
}
