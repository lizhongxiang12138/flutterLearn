import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//void main() => runApp(new Learn02App());

/**
 * 评分
 */
class Learn02App extends StatefulWidget {

   @override
  State<StatefulWidget> createState() => new Learn02AppState();
}
/**
 * 评分 state
 */
class Learn02AppState extends State<Learn02App>{
  bool _isFavorited = true;
  int _favoriteCount =41;

  void _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _favoriteCount -=1;
        _isFavorited = false;
      }else{
        _favoriteCount+=1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: (_isFavorited?
            Icon(Icons.star):Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
          Text('$_favoriteCount'),
        ],
      ),
    );
    return titleSection;
  }
}

/**
 * 按钮
 */
class ButtonGroup extends StatelessWidget{

  Column buildButtomColum(IconData icon,String label,BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,color: Theme.of(context).primaryColor,),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtomColum(Icons.call, "电话", context),
          buildButtomColum(Icons.near_me, "导航", context),
          buildButtomColum(Icons.share, "分享", context),
        ],
      ),
    );
  }
}

/**
 * 文字描述
 */
class TextDescription extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
          "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run",
        softWrap: true,
      ),
    );
  }
}

/**
 * 图片选择
 */
class ImagesSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      'images/lake.jpg',
      height: 240.0,
      fit: BoxFit.cover,
    );
  }
}

/**
 * 总有总页面
 */
class Learn02AppTotalPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "第一个app",
      home: Scaffold(
          appBar: AppBar(
            title: Text("哈哈哈"),
            centerTitle: true,
          ),
          body:ListView(
            children: <Widget>[
              new ImagesSection(),
              new Learn02App(),
              new ButtonGroup(),
              new TextDescription(),
            ],
          )
      ),
    );
  }
}
