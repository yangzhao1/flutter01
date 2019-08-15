import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class YYhomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return YYHomeStatePage();
  }
}

class YYHomeStatePage extends State<YYhomePage> {
  final List<YYTabItemModel> _tabItems = [
    YYTabItemModel('images/home_home.png', 'images/home_home_sel.png', '首页'),
    YYTabItemModel('images/home_home.png', 'images/home_home_sel.png', '管理'),
    YYTabItemModel('images/home_home.png', 'images/home_home_sel.png', '我的'),
  ];

  int _selectedIndex = 1;

  List<String> _bannerUrls = ['http://via.placeholder.com/350x150','http://via.placeholder.com/350x150','http://via.placeholder.com/350x150'];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _createBottomBarItems(),
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
 //底部tabbar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _createBottomBarItems() {
    List<BottomNavigationBarItem> _items = [];
    for (YYTabItemModel model in this._tabItems) {
      BottomNavigationBarItem _item = _createBottomBarItem(model);
      _items.add(_item);
    }
    return _items;
  }

  BottomNavigationBarItem _createBottomBarItem(YYTabItemModel itemModel) {
    return BottomNavigationBarItem(
        icon: Image(
          image: AssetImage(itemModel.normalImage),
          width: 25,
          height: 25,
        ),
        activeIcon: Image(
          image: AssetImage(itemModel.selImage),
          width: 25,
          height: 25,
        ),
        title: new Text(itemModel.title));
  }

}

//
class YYTabItemModel {
  YYTabItemModel(this.normalImage, this.selImage, this.title);

  String normalImage;
  String selImage;
  String title;
}
