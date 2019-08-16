import 'package:flutter/material.dart';

class YYManagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return YYManageStatePage();
  }
}

class YYManageStatePage extends State<YYManagePage> {
  // final Map<String, List> _items = {
  //   '审批节点上报管理': [
  //     {'title': '上报信息', 'image': ''},
  //   ],
  //   '替办管理':[{'title':''}]
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('管理'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          _createSliverHeader('审批节点上报管理'),
          _createCell(),
          _createSliverHeader('督办管理'),
          _createCell(),
        ],
      ),
    );
  }

  //section header
  SliverPersistentHeader _createSliverHeader(String title) {
    return SliverPersistentHeader(
      delegate: GradHeader(title),
    );
  }

  // cell
  SliverPadding _createCell() {
    return SliverPadding(
      padding: EdgeInsets.all(5),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            //创建子widget
            return _createItemCell();
          },
          childCount: 4,
        ),
      ),
    );
  }

  Container _createItemCell() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.ac_unit,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '主题',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
//
class UnitItemModel<T> {
  UnitItemModel(this.title,this.imageName,this.className);
  String title;
  String imageName;
  T className; 
}
//
class GradHeader extends SliverPersistentHeaderDelegate {
  GradHeader(this.title);

  final String title;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 30,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
            width: 4,
            color: Colors.blue,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 30;
  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
