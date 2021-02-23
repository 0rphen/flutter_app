import 'package:flutter/material.dart';
import 'package:flutter_app/model/news.dart';
import 'package:flutter_app/view/widgets/news_card.dart';

class BuildItemList extends StatelessWidget {
  final News snapshotNews;
  final Function(News) onTapFav;
  
  BuildItemList({Key key, @required this.snapshotNews, @required this.onTapFav});

  @override
  Widget build(BuildContext context) {
    return NewsCard(news: snapshotNews, onTapFav: onTapFav);
  }
}
