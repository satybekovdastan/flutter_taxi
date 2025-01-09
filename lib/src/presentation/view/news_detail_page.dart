import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:merphy/src/domain/entities/export_entities.dart';

import '../../core/components/buttons/retry_button.dart';
import '../_widget/loading_widget.dart';
import '../_widget/news/news_card.dart';
import '../cubit/export_news_cubits.dart';

class NewsDetailPage extends StatelessWidget {

  const NewsDetailPage({
    super.key,
    required this.news,
  });

  final NewsEntity? news;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<GetNewsDetailCubit>()..getNewsDetail(newsId: news?.id ?? 0),
      child: _NewsDetailPage(news: news),
    );
  }

}

class _NewsDetailPage extends StatelessWidget {
  const _NewsDetailPage({required this.news});

  final NewsEntity? news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: BlocConsumer<GetNewsDetailCubit, GetNewsDetailState>(
        listener: (context, state) {},
        buildWhen: (_, current) {
          return current is GetNewsDetailInitial ||
              current is GetNewsDetailLoading ||
              current is GetNewsDetailError ||
              current is GetNewsDetailLoaded;
        },
        builder: (context, state) {
          if (state is GetNewsDetailLoading) {
            return AppLoadingWidget();
          } else if (state is GetNewsDetailError) {
            return RetryButton(
              text: state.message,
              retryAction: () => context
                  .read<GetNewsDetailCubit>()
                  .getNewsDetail(newsId: news?.id ?? 0),
            );
          } else if (state is GetNewsDetailLoaded) {
            final item = state.item;
            return NewsCard(item);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
