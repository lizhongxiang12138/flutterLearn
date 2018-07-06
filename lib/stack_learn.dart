import 'package:flutter/material.dart';

/**
 * stack 测试
 */
class MyStack extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: AlignmentDirectional(1.0, 0.0),
      children: <Widget>[
        new Center(
          child: new Text("第一页"),
        ),
        new Center(
          child: new Text("第二页"),
        ),
      ],
    );
  }
}

class StackPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "测试",
      home: new Scaffold(
        appBar: AppBar(
          title: new Text("测试"),
          centerTitle: true,
        ),
        body: MyStack(),
      ),
    );
  }
}