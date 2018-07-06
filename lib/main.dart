import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:my_fast_app/learn02.dart';
import 'package:my_fast_app/bottom_navigation_bar.dart';

void main() => runApp(new MaterialApp(
  title: "hhh",
  home: new MyBottomNavigationBar(
    titleText: "底部导航栏测试",
    currentIndex: 1,
    elements: <MyBottomNavigationBarItem>[
      new MyBottomNavigationBarItem(
        body: new Center(
          child: new Text("第一页"),
        ),
        navigation: new BottomNavigationBarItem(
            icon: new Icon(Icons.star),
            title: new Text("动态"),
        )
      ),
      new MyBottomNavigationBarItem(
        body: new ListView(
                children: <Widget>[
                  new ImagesSection(),
                  new Learn02App(),
                  new ButtonGroup(),
                  new TextDescription(),
                ],
              ),
        navigation: new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("主页")
        )
      ),
      new MyBottomNavigationBarItem(
        body: new Center(
          child: new Text("第三页"),
        ),
        navigation: new BottomNavigationBarItem(
            icon: new Icon(Icons.near_me),
            title: new Text("位置"),
        )
      )
    ],
  ),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Learn02AppTotalPage();
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('欢迎光临'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final titles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final divided = ListTile.divideTiles(
        context: context,
        tiles: titles,
      ).toList();
      
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("保存的数据"),
        ),
        body: new ListView(children: divided),
      );
      
    }));
  }
}
