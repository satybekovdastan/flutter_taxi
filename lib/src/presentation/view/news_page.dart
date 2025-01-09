import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:merphy/src/presentation/_widget/news/news_card.dart';
import 'package:merphy/src/presentation/view/news_detail_page.dart';

import '../../core/components/buttons/retry_button.dart';
import '../../domain/entities/export_entities.dart';
import '../../utils/logger.dart';
import '../_widget/error_widget.dart';
import '../_widget/loading_widget.dart';
import '../cubit/export_news_cubits.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({
    super.key,
  });

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ScrollController _scrollController = ScrollController();

  late GetNewsCubit _newsCubit;

  @override
  void initState() {
    _newsCubit = GetIt.I<GetNewsCubit>()..getNews();
    super.initState();
  }

  void scrollToTop() {
    _scrollController.position.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: AppBar(
        title: Text("News"),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => _newsCubit,
          ),
        ],
        child: BlocConsumer<GetNewsCubit, GetNewsState>(
          listener: (context, state) {},
          buildWhen: (_, current) {
            return current is GetNewsInitial ||
                current is GetNewsLoading ||
                current is GetNewsError ||
                current is GetNewsLoaded;
          },
          builder: (context, state) {
            if (state is GetNewsLoading) {
              return AppLoadingWidget();
            } else if (state is GetNewsError) {
              // return AppErrorWidget(state.message);
              logger.e("GetNewsFailureState ${state.message}");
              return RetryButton(
                text: state.message,
                retryAction: () => context.read<GetNewsCubit>().getNews(),
              );
            } else if (state is GetNewsLoaded) {
              final news = state.list;
              logger.e("GetNewsLoaded ${news}");
              return _NewsView(news, _scrollController);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _NewsView extends StatelessWidget {
  const _NewsView(this.news, this.scrollController);

  final List<NewsEntity> news;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              // Add refresh logic here
            },
            child: ListView.separated(
              controller: scrollController, // Use the passed ScrollController
              itemCount: news.length,
              itemBuilder: (BuildContext context, int index) {
                final item = news[index];
                return NewsCard(
                  item,
                  onTap: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailPage(news: item),
                        ));
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
            ),
          ),
        ),
      ],
    );
  }
}
