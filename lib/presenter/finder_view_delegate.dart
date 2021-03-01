import 'package:flutter/material.dart';
import 'package:flutter_app/data/api_service.dart';
import 'package:flutter_app/presenter/build_itemList.dart';
import 'package:flutter_app/view/widgets/dialog_button.dart';

class NewsSearch extends SearchDelegate {
  String seleccion = '';
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      child: Center(
        child: Container(
          child: FutureBuilder(
            future: ApiService().getSearch(exp: query),
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
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    print(query);
    if (query.isEmpty) {
      return Container();
    }
    return Container(
      child: Center(
        child: Container(
          child: FutureBuilder(
            future: ApiService().getSearch(exp: query),
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
  }
}
