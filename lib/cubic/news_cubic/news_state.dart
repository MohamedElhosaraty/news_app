part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final Temperatures newsBusiness;
  NewsSuccess(this.newsBusiness);

}

class NewsFailed extends NewsState {}

class NewsNoInternetConnection extends NewsState {}

