import 'package:flutter/material.dart';
import 'package:flutter_app/presenter/build_view.dart';
import 'package:flutter_app/presenter/finder_view_delegate.dart';
import 'package:flutter_app/utils/styles.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int vistaServicio = 1;
  String vista = 'NewsList';
  static const drawerOptions = <Map<String, dynamic>>[
    {
      'value': 1,
      'text':
          'All articles about Tesla from the last month, sorted by recent first'
    },
    {'value': 2, 'text': 'Top business headlines in the US right now'},
    {
      'value': 3,
      'text':
          'All articles mentioning Apple from yesterday, sorted by popular publishers first'
    },
    {'value': 4, 'text': 'Top headlines from TechCrunch right now'},
    {
      'value': 5,
      'text':
          'All articles published by the Wall Street Journal in the last 6 months, sorted by recent first'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'BIT News',
          style: TextStyle(color: Colors.black26),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: NewsSearch(),
                    query: '',);
                },
              )),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Image.network(
                  'https://bit.institute/images/Instituto-Cursos-Programacion.png'),
            )),
            ...drawerOptions
                .map((option) => InkWell(
                      onTap: () {
                        setState(() {
                          vistaServicio = option['value'];
                          Navigator.pop(context);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Text(
                          option['text'],
                          style: Styles.drawerOptionStyle,
                        ),
                      ),
                    ))
                .toList(),
            InkWell(
              onTap: () {
                setState(() {
                  vistaServicio = 8;
                  vista = 'Finder';
                  Navigator.pop(context);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  'News Search...',
                  style: Styles.drawerOptionStyle,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20.0, left: 20.0),
        child: BuildView(
          vista: vista,
          vistaServicio: vistaServicio,
        ),
      ),
    );
  }
}
