import 'package:flutter/material.dart';
import 'package:untitled10/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../style/textstyle.dart';


class ListOfNews extends StatelessWidget {
  final NewsModel news;
  final bool isInHome;
  const ListOfNews({Key? key, required this.news,this.isInHome = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var article = news.articles![index];
        if(article.title != "[Removed]") {
          return GestureDetector(
            onTap: () async {
              if (article.url != null) {
                final Uri url = Uri.parse(article.url!);
                try {
                  bool launch = await launchUrl(url);
                  if (!launch) {
                    throw Exception("Cannot launch $url");
                  }
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Cannot launch the url",
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Url is not available now, try again later",
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: buildNewsCard(
              imageUrl: article.urlToImage ??
                  "https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=",
              title: article.title ?? "[Title]",
              description: article.description ??
                  "[Description]",
              author: article.author ?? "[Author]",
            ),
          );
        }
        else{
          return const SizedBox();
        }
      },
      separatorBuilder: (context, index) {
        var article = news.articles![index];
        if(article.title == '[Removed]'){
          return const SizedBox();
        }
        return const SizedBox(
          height: 20.0,
        );
      },
      itemCount: news.articles!.length, //number of articles
      physics:isInHome ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
      shrinkWrap: isInHome,
    );
  }
  Widget buildNewsCard({
    required String imageUrl,
    required String title,
    required String description,
    required String author,
  }) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyle.titlePopularTextStyle(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Divider(),
          Text(
            description,
            style: AppTextStyle.descriptionPopularTextStyle(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Divider(),
          Expanded(
            child: Image(
              image: NetworkImage(
                imageUrl,
              ),
              errorBuilder: (context, error, stackTrace) {
                return const Image(
                  image: NetworkImage(
                    "https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=",
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Text(
            author,
            style: AppTextStyle.authorPopularTextStyle(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
