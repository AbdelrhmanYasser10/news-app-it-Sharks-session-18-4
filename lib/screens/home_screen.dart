import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/models/news_model.dart';
import 'package:untitled10/shared/cubits/news_cubit.dart';
import 'package:untitled10/shared/style/textstyle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if (state is GetBreakingNewsLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    else if(state is GetBreakingNewsError){
      return Scaffold(
        body: Center(
          child: Text(
            state.message,
          ),
        ),
      );
    }
    else {
      var cubit = NewsCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Breaking news",
            style: AppTextStyle.appBarTextStyle(),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                    items: sliderNews(
                        context: context,
                      model:cubit.breakingNews!,
                    ),
                    options: CarouselOptions(
                      height: 250,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(
                          milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {

                      },
                      scrollDirection: Axis.horizontal,
                    )
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Popular Now",
                  style: AppTextStyle.titleTextStyle(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.all(
                      10.0
                  ),
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Title of news",
                        style: AppTextStyle.titlePopularTextStyle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Divider(),
                      Text(
                        "description" * 50,
                        style: AppTextStyle.descriptionPopularTextStyle(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Divider(),
                      Expanded(
                        child: Image(
                          image: NetworkImage(
                            "https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=",
                          ),
                        ),
                      ),
                      const Divider(),
                      Text(
                        "Author",
                        style: AppTextStyle.authorPopularTextStyle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  },
);
  }

  List<Widget> sliderNews({
    required BuildContext context,
  required NewsModel model,
}){
    List<Widget> widgets=[];
    if(model.articles!.length >= 5) {
      for (int i = 0; i < 5; i++) {
        widgets.add(
          buildSliderCard(
            title: model.articles![i].title ?? "[Title]",
            context: context,
            author: model.articles![i].author ?? "[Author]",
            description: model.articles![i].description ?? "[Description]",
            imageUrl: model.articles![i].urlToImage ??
                "https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=",
          ),
        );
      }
    }
    else {
      model.articles!.forEach((element) {
        widgets.add(
          buildSliderCard(
            title: element.title ?? "[Title]",
            context: context,
            author: element.author ?? "[Author]",
            description: element.description ?? "[Description]",
            imageUrl: element.urlToImage ??
                "https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=",
          ),
        );
      });
    }
    return widgets;
  }

  Widget buildSliderCard({
    required BuildContext context,
  required String imageUrl,
  required String title,
  required String description,
  required String author,
}){
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.green,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image(
                image: NetworkImage(
                    imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
                20.0
            ),
            height: 250,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: AppTextStyle.titleSliderTextStyle(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  description,
                  style: AppTextStyle.descriptionSliderTextStyle(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  author,
                  style: AppTextStyle.authorSliderTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
