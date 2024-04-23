import 'package:flutter/material.dart';
import 'package:untitled10/shared/style/textstyle.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: buildCategoryCard(
                          title: "Technology",
                          icon: Icons.biotech
                        ),
                    ),
                    Expanded(
                        child: buildCategoryCard(
                          title: "Business",
                          icon: Icons.person_2
                        ),
                    ),

                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: buildCategoryCard(
                          title: "Health",
                          icon: Icons.health_and_safety_outlined
                        ),
                    ),
                    Expanded(
                        child: buildCategoryCard(
                          title: "Sport",
                          icon: Icons.sports_baseball
                        ),
                    ),

                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: buildCategoryCard(
                          title: "Science",
                          icon: Icons.science
                        ),
                    ),
                    Expanded(
                        child: buildCategoryCard(
                          title: "Entertainment",
                          icon: Icons.play_arrow_outlined
                        ),
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

  Widget buildCategoryCard({
  required IconData icon,
  required String title
}){
    return GestureDetector(
      onTap: (){

      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(
             icon,
              size: 72.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              title,
              style: AppTextStyle.titlePopularTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
