import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/layout/main_layout.dart';
import 'package:untitled10/shared/cubits/news_cubit.dart';
import 'package:untitled10/shared/network/dio_helper.dart';

void main() async{
   DioHelper.initializeDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBreakingNews(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false, // Android 12
        ),
        home: const MainLayout(),
      ),
    );
  }
}
