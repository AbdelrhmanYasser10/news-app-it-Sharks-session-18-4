import 'package:flutter/material.dart';
import 'package:untitled10/screens/results_screen.dart';
import 'package:untitled10/shared/style/textstyle.dart';

import '../shared/cubits/news_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "News App",
                    style: AppTextStyle.appBarTextStyle(),
                  ),
                  Text(
                    "Search for any query",
                    style: AppTextStyle.labelStyle(),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: "Query",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.black
                      ),
                    )
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Query must not be empty";
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      NewsCubit.get(context).getCategoryNewsOrGetSearchNews(text: _searchController.text,isFromCategory: false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ResultsScreen(title: _searchController.text , isFromCategory: false,),
                        ),
                      );

                    }
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 55),
                  textStyle: AppTextStyle.titlePopularTextStyle()
                ),
                  child: const Text("Search"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
