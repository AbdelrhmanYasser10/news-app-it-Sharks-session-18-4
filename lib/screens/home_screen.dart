import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled10/shared/style/textstyle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: [
                  Container(
                    height: 250,
                    color: Colors.green,
                  ),
                  Container(
                    height: 250,
                    color: Colors.red,
                  ),
                  Container(
                    height: 250,
                    color: Colors.yellowAccent,
                  ),
                ],
                options: CarouselOptions(
                  height: 250,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration:const Duration(milliseconds: 800),
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
          ],
        ),
      ),
    );
  }
}
