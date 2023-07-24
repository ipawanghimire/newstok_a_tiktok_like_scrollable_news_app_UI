import 'package:flutter/material.dart';
import 'package:newstok/constants/appcolor.dart';
import 'package:newstok/model/data.dart';
import 'package:newstok/screen/widget/common/icon_pannel.dart';
import 'package:newstok/screen/widget/common/retext.dart';

class NewsCard extends StatefulWidget {
  final NewsItem newsItem;

  NewsCard(this.newsItem);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add border around the image
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 16, // Set the aspect ratio for the image frame
            child: Image.network(
              widget.newsItem.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          ReText(
            size: 18,
            text: _truncateText(widget.newsItem.title, 80),
            weight: FontWeight.bold,
            textcolor: AppColors.white,
          ),
          ReText(
            text: widget.newsItem.date,
            textcolor: AppColors.grey,
            size: 12,
            weight: FontWeight.w300,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReText(
                      text: _truncateText(widget.newsItem.description, 450),
                      textcolor: AppColors.white,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: IconPannel(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + '...';
    }
  }
}
