import 'package:dio/dio.dart';
import 'package:news_app/modeis/news-models.dart';

class News_repository {

  final _dio =Dio();

  Future<Temperatures> getTopNews () async{
    final res = await _dio.get('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5a7ad4ceab9e462996901c363ec955ad');
    final data = Temperatures.fromJson(res.data);
    return data;
  }

}

