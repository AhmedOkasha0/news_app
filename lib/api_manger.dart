import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsRewsponse.dart';
import 'package:news_app/model/sourcesResponce.dart';

class ApiManger {
  static const String baseUrl = 'newsapi.org';
  static Future<SourcesResponce> getSources(String categoryId) async {
    /// https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources',
        {'apiKey': '32ce8b31ef664c44b9566e064c93289e',
          'category': categoryId
        });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var sourcesResponse = SourcesResponce.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsRewsponse> getNews({String? sourceId,String? searchKeyword}) async {
    ///https://newsapi.org /v2/everything ?q=bitcoin& apiKey=32ce8b31ef664c44b9566e064c93289e

    var url = Uri.https(baseUrl, '/v2/everything',
        {'apiKey': '32ce8b31ef664c44b9566e064c93289e', 'sources': sourceId,
          'q':searchKeyword,
        },);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var newsResponse = NewsRewsponse.fromJson(json);
      return newsResponse;
    } catch (e) {
      throw e;
    }
  }
}
