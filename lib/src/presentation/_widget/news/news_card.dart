import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';

class NewsCard extends StatefulWidget {
  final NewsEntity news;
  final GestureTapCallback? onTap;

  const NewsCard(
      this.news, {
        super.key,
        this.onTap,
      });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  // int likeCount = 0;
  // int dislikeCount = 0;

  @override
  void initState() {
    super.initState();
    // likeCount = widget.news.likes ?? 0;
    // dislikeCount = widget.news.dislikes ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width / 1.5;
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            width: width,
            height: height,
            imageUrl: widget.news.image ?? '',
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return Container(
                width: width,
                height: height,
                color: Color(0xFFE6E6E6),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.news.title ?? '',
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.news.createdAt ?? '',
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
