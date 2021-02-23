class News {
  Source source;
  String urlToImage;
  String title;
  String url;
  String author;
  DateTime dateTime;
  String content;
  String description;

  News({
    this.source,
    this.urlToImage,
    this.title,
    this.url,
    this.author,
    this.dateTime,
    this.content,
    this.description,
  });

  News.fromJson(Map<String, dynamic> map) {
    source = Source.fromJson(map['source']);
    urlToImage = map['urlToImage'];
    title = map['title'];
    url = map['url'];
    author = map['author'];
    dateTime = map['dateTime'];
    content = map['content'];
    description = map['description'];
  }
}

class NewsApiModel {
  String status;
  int totalResults;
  List<News> articles;

  NewsApiModel({this.status, this.totalResults, this.articles});

  NewsApiModel.fromJson(Map<String, dynamic> map) {
    var mapArticles = map['articles'] as List;
    status = map['status'];
    totalResults = map['totalResults'];
    articles = mapArticles.map((article) => News.fromJson(article)).toList();
  }
}

class Source {
  String id;
  String name;

  Source({
    this.id,
    this.name,
  });

  Source.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
