import 'package:flutter/material.dart';
import 'package:my_fast_app/learn02.dart';

/**
 * 我的底部导航栏
 */
class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({
    @required this.elements,
    @required this.titleText,
    this.currentIndex
  });

  int currentIndex =0;

  /**
   * 导航栏子元素
   */
  @required List<MyBottomNavigationBarItem> elements;

  /**
   * 页面标题
   */
  @required String titleText;

  @override
  State<StatefulWidget> createState() => new MyBottomNavigationBarState(
      element: elements,
      titleText: titleText,
      currentIndex: currentIndex
  );
}

/**
 * 我的导航栏子元素定义
 */
class MyBottomNavigationBarItem{
  //对应的身体
  @required Widget body;
  //对应的导航菜单
  @required BottomNavigationBarItem navigation;

  MyBottomNavigationBarItem({this.body,this.navigation});
}

/**
 * 状态控制
 */
class MyBottomNavigationBarState extends State<MyBottomNavigationBar>{

  MyBottomNavigationBarState({
    @required this.element,
    @required this.titleText,
    this.currentIndex
  }){
    //初始化底部导航栏 items 和 底部导航栏的 items 的 body
    for(MyBottomNavigationBarItem e in element){
      navigationBarItems.add(e.navigation);
      navigationBarItemBodys.add(e.body);
    }
  }

  int currentIndex =1;
  List<MyBottomNavigationBarItem> element;
  String titleText;

  setCurrentIndex(int index){
    setState(() {
      currentIndex = index;
    });
  }

  List<BottomNavigationBarItem> navigationBarItems = <BottomNavigationBarItem>[];
  List<Widget> navigationBarItemBodys = <Widget>[];

  @override
  Widget build(BuildContext context) {
    BottomNavigationBar bnb = new BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setCurrentIndex(index);
      },
      items: navigationBarItems,
    );
    return new Scaffold(
      appBar:new AppBar(
        title: new Text(titleText),
        centerTitle: true,
      ),
      body: navigationBarItemBodys[currentIndex],
      bottomNavigationBar: bnb,
    );
  }
}

