import 'package:flutter/material.dart';
import '../home/Home.dart';
import '../cart/Cart.dart';
import '../category/Category.dart';
import '../user/User.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    UserPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ishop"),
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index){
          setState(() {
            this._currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("分类")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("购物车")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text("我的")
          )
        ],
      ),
    );
  }
}
