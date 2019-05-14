import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(
    fontSize: 18.0,
  );
  final _saved = new Set<WordPair>();

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Startup Name Generator1'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
          ],
        ),
//      body: _buildSuggestions(),
        body: new ListView(
          children: _getListData(),
        ));
  }

  _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 10; i++) {
//      widgets.add(_buildRow(_suggestions[i]));
      final wordPair = new WordPair.random();
      widgets.add(new GestureDetector(
        child: _buildRow(wordPair),
        onTap: () {
          print("点击："+wordPair.asPascalCase);
        },
      ));
    }
    return widgets;
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new Container(
//      height: 50,
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Container(
                        padding: EdgeInsets.all(5),
                        child: new Text(
                          "社区居民、健投员工捐赠图书万余册 拜博口腔捐资10万",
                          style: new TextStyle(fontSize: 15),
                        )),
                    new Row(
                      children: <Widget>[
                        new Expanded(
                            child: new Container(
                              padding: EdgeInsets.all(5),
                              child: new Text(
//                            "2018-05-10",
                                pair.asPascalCase,
                                style: new TextStyle(fontSize: 12),
                              ),
                            )),
                        new Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: new Row(children: [
                              new Image.asset(
                                "images/zan.png",
                              ),
                              new Text(
                                "100",
                                style: new TextStyle(fontSize: 12),
                              ),
                              new Icon(Icons.face),
                              new Text(
                                "22",
                                style: new TextStyle(fontSize: 12),
                              )
                            ])),
                      ],
                    ),
                  ]),
            ),
            new Expanded(
              child: new Container(
                  padding: EdgeInsets.all(10),
                  child: new Image.network(
//                      "https://tk-live-20190404-1257840667.cos.ap-beijing.myqcloud.com/frontCover.png")),
                    "https://tk-news-20190218-1257840667.cos.ap-beijing.myqcloud.com/1550470909099.jpg",
                    width: 135,
                    height: 85,
                    fit: BoxFit.fitWidth,
                  )),
            )
          ],
        ));

//    return new ListTile(
//      title: new Text(
//        pair.asPascalCase,
//        style: _biggerFont,
//      ),
//      trailing: new Icon(
//        alreadySaved ? Icons.favorite : Icons.favorite_border,
//        color: alreadySaved ? Colors.red : Colors.red,
//      ),
//      onTap: () {
//        setState(() {
//          if (alreadySaved) {
//            _saved.remove(pair);
//          } else {
//            _saved.add(pair);
//          }
//        });
//      },
//    );
  }
}
