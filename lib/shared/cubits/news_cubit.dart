import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled10/shared/network/constants.dart';
import 'package:untitled10/shared/network/dio_helper.dart';

import '../../models/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context)=>BlocProvider.of(context);

  NewsModel? breakingNews;

  void getBreakingNews(){
    emit(GetBreakingNewsLoading());
    DioHelper.getData(
        endPoint: TOPHEADLINES,
      queryParameters: {
          "apiKey":APIKEY,
          "country":"us",
      },
    ).
        // success
    then((value){
      if(value.statusCode! >= 200 && value.statusCode! <= 299){
        breakingNews = NewsModel.fromJson(value.data);
        emit(GetBreakingNewsSuccessfully());
      }
      else{
        emit(GetBreakingNewsError(message: "Server Error"));
      }
    }).
        //error
    catchError((error){
      emit(GetBreakingNewsError(message: error.toString()));
    });
  }
}
