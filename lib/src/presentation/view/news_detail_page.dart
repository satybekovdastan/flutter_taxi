import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:merphy/src/domain/entities/export_entities.dart';
import 'package:merphy/src/utils/logger.dart';
import '../../core/components/buttons/retry_button.dart';
import '../_widget/loading_widget.dart';
import '../_widget/news/news_detail.dart';
import '../cubit/export_news_cubits.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsEntity news;

  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<GetNewsDetailCubit>()..getNewsDetail(newsId: news.id ?? 0),
      child: _NewsDetailPage(news: news),
    );
  }
}

class _NewsDetailPage extends StatefulWidget {
  final NewsEntity news;

  const _NewsDetailPage({required this.news});

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<_NewsDetailPage> {
  String detailText = '';
  bool showButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: BlocConsumer<GetNewsDetailCubit, GetNewsDetailState>(
        listener: (context, state) {
          if (state is GetNewsDetailError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is GetNewsDetailTextChanged) {
            setState(() {
              detailText = state.text;
              showButton = false;
            });
          }
        },
        buildWhen: (_, current) {
          return current is GetNewsDetailInitial ||
              current is GetNewsDetailLoading ||
              current is GetNewsDetailError ||
              current is GetNewsDetailLoaded;
        },
        builder: (context, state) {
          logger.e("NEWS DETAIL $state");
          if (state is GetNewsDetailLoading) {
            return AppLoadingWidget();
          } else if (state is GetNewsDetailError) {
            return RetryButton(
              text: state.message,
              retryAction: () => context.read<GetNewsDetailCubit>().getNewsDetail(newsId: widget.news.id ?? 0),
            );
          } else if (state is GetNewsDetailLoaded) {
            return NewsDetailCard(state.item, text: detailText, showButton: showButton);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
