import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';

import '../../cubit/export_news_cubits.dart';

class NewsDetailCard extends StatelessWidget {
  final NewsEntity news;
  final GestureTapCallback? onTap;
  final String? text;

  final bool showButton;

  const NewsDetailCard(this.news, {super.key, this.onTap, this.text = '', this.showButton = true});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width / 1.5;

    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            width: width,
            height: height,
            imageUrl: news.image ?? '',
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
                  news.title ?? '',
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 8),
                Text(
                  news.createdAt ?? '',
                  style: const TextStyle(fontSize: 17),
                ),
                if (showButton)
                ElevatedButton(
                  onPressed: () {
                    context.read<GetNewsDetailCubit>().setNewsText();
                  },
                  child: Text('Set Text'),
                ),
                if (text != null)
                Text(
                  text!,
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}