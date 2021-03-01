import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/model/news.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String urlForApi(optionUrl) {
    switch (optionUrl) {
      case 1: //Testla
        return 'https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=316910e3784d49278ec306613c5f9576';
      case 2: //Country
        return 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=316910e3784d49278ec306613c5f9576';
      case 3: //Apple
        return 'https://newsapi.org/v2/everything?q=apple&sortBy=popularity&apiKey=316910e3784d49278ec306613c5f9576';
      case 4: //TechCrunch
        return 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=316910e3784d49278ec306613c5f9576';
      case 5: //Wallstreet
        return 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=316910e3784d49278ec306613c5f9576';
      default:
        return 'newsapi.org';
    }
  }

  getDio({@required int optionUrl}) async {
    var dio = Dio();
    Response response = await dio.get(urlForApi(optionUrl));
    if (response.statusCode == 200) {
      return NewsApiModel.fromJson(response.data);
    } else {
      print('Error inesperado en la petición');
    }
  }

  String getApiKey() {
    return '316910e3784d49278ec306613c5f9576';
  }

  getSearch({@required String exp}) async {
    print(exp);
    final url = Uri.https(
      urlForApi(6),
      '/v2/everything',
      {'q': exp, 'apiKey': getApiKey()},
    );
    final response = await http.get(url);
    final decodeD = json.decode(response.body);
    return NewsApiModel.fromJson(decodeD);
  }
}
