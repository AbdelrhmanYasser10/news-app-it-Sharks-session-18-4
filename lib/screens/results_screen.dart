import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/shared/cubits/news_cubit.dart';
import 'package:untitled10/shared/style/textstyle.dart';
import 'package:untitled10/shared/widgets/list_of_news/list_of_news.dart';

class ResultsScreen extends StatelessWidget {
  final String title;
  final bool isFromCategory;
  const ResultsScreen({Key? key, required this.title , this.isFromCategory = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          title,
          style: AppTextStyle.appBarTextStyle(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },

        ),
      ),
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          if(state is GetCategoryNewsLoading){
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          else if(state is GetCategoryNewsError){
            return Center(
              child: Text(
                state.message,
                style: AppTextStyle.labelStyle(),
              ),
            );
          }
          else {
            return RefreshIndicator(
              onRefresh: () => Future(() => cubit.getCategoryNewsOrGetSearchNews(text: title.toLowerCase(),isFromCategory: isFromCategory)),
              child: ListOfNews(
                  news: cubit.categoryNews!,
                  isInHome: false,
              ),
            );
          }
        },
      ),
    );
  }
}
