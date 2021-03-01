import 'package:flutter/material.dart';
import 'package:flutter_app/data/api_service.dart';
import 'package:flutter_app/model/news.dart';
import 'package:flutter_app/presenter/build_itemList.dart';
import 'package:flutter_app/presenter/finder_view_delegate.dart';
import 'package:flutter_app/view/widgets/dialog_button.dart';

class BuildView extends StatelessWidget {
  final String vista;
  final int vistaServicio;
  final String index;

  BuildView({@required this.vista, @required this.vistaServicio, this.index});

  @override
  Widget build(BuildContext context) {
    switch (vista) {
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                future: ApiService().getDio(optionUrl: vistaServicio),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot);
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: (snapshot.data).articles.length,
                      itemBuilder: (BuildContext context, int index) =>
                          BuildItemList(
                        snapshotNews: (snapshot.data).articles[index],
                        onTapFav: (news) {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    content: Text(
                                        'Are you sure to ad this news to favorite list?'),
                                    actions: [
                                      DialogButton(
                                        text: 'No',
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                      DialogButton(
                                        text: 'Yes',
                                        onPressed: () {},
                                      )
                                    ],
                                  ));
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Text('Error'),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        );
      case 'Finder':
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text('Peliculas en Cines'),
            backgroundColor: Colors.indigoAccent,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    query: '',
                    delegate: NewsSearch(),
                  );
                },
              )
            ],
          ),
        );
      default:
        return Container();
    }
  }

  Future<NewsApiModel> futureData(String opt) {
    switch (opt) {
      case 'api':
        return ApiService().getDio(optionUrl: vistaServicio);
        break;
      case 'finder':
        return ApiService().getSearch(exp: index);
        break;
      default:
        return ApiService().getDio(optionUrl: vistaServicio);
        break;
    }
  }
}
