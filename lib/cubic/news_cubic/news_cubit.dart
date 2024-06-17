import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:news_app/modeis/news-models.dart';
import 'package:news_app/repository/news_repository.dart';


part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Temperatures? newsBusiness;
  StreamSubscription<ConnectivityResult>? subscription;

  void getNews ()async {
     final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none){
      emit(NewsNoInternetConnection());
    }

    try {
      emit(NewsLoading());
      newsBusiness = await News_repository().getTopNews();
         emit(NewsSuccess(newsBusiness!));
    }  catch (e) {
      if (newsBusiness == null ){
        emit(NewsFailed());
      }else{
        emit(NewsSuccess(newsBusiness!));
      }
    }

  }

}
