part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}


class GetBreakingNewsLoading extends NewsState{}

class GetBreakingNewsSuccessfully extends NewsState{}

class GetBreakingNewsError extends NewsState{
  final String message;
  GetBreakingNewsError({required this.message});
}

class GetCategoryNewsLoading extends NewsState{}

class GetCategoryNewsSuccessfully extends NewsState{}

class GetCategoryNewsError extends NewsState{
final String message;
GetCategoryNewsError({required this.message});
}