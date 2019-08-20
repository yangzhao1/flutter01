import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'report_page.dart';

class YYManagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return YYManageStatePage();
  }
}

class YYManageStatePage extends State<YYManagePage> {
  final List reports = _initReportList();
  final List supervises = _initSuperviseList();
  final List warns = _initWarnsList();
  final List statistics = _initStatisticsList();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('管理'),
        leading: null,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          _createSliverHeader('审批节点上报管理'),
          _createCell(reports),
          _createSliverHeader('督办管理'),
          _createCell(supervises),
          _createSliverHeader('预警管理'),
          _createCell(warns),
          _createSliverHeader('统计分析管理'),
          _createCell(statistics),
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
  SliverPadding _createCell(List<UnitItemModel> items) {
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
            return _createItemCell(items[index]);
          },
          childCount: items.length,
        ),
      ),
    );
  }

  GestureDetector _createItemCell(UnitItemModel item) {
    return GestureDetector(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(item.imageName),
              width: 50,
              height: 50,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              item.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        print('object---------------');
        Navigator.push(context, CupertinoPageRoute(builder:item.pageBuilder));
      },
    );
  }

  static List<UnitItemModel> _initReportList() {
    return [
      UnitItemModel(
          '上报信息', 'images/home_home_sel.png', (cxt) => YYReportPage(titleString: '上报信息',)),
    ];
  }

  static List<UnitItemModel> _initSuperviseList() {
    return [
      UnitItemModel(
          '督办查询', 'images/home_home_sel.png', (cxt) => YYReportPage(titleString: '督办查询',)),
      UnitItemModel(
          '发起督办', 'images/home_home_sel.png', (cxt) => YYReportPage(titleString: '发起督办',)),
    ];
  }

  static List<UnitItemModel> _initWarnsList() {
    return [
      UnitItemModel(
          '审批超市', 'images/home_home_sel.png', (cxt) => YYReportPage(titleString: '审批超市',)),
      UnitItemModel(
          '审批预警', 'images/home_home_sel.png', (cxt) => YYReportPage(titleString: '审批预警',)),
    ];
  }

  static List<UnitItemModel> _initStatisticsList() {
    return [
      UnitItemModel(
          '预警统计', 'images/home_home_sel.png', (cxt) => YYReportPage(titleString: '上报信息',)),
      UnitItemModel(
          '超时统计', 'images/home_home_sel.png', (cxt) => YYReportPage()),
      UnitItemModel(
          '绩效统计', 'images/home_home_sel.png', (cxt) => YYReportPage()),
      UnitItemModel(
          '人员超时', 'images/home_home_sel.png', (cxt) => YYReportPage()),
      UnitItemModel(
          '预警统计', 'images/home_home_sel.png', (cxt) => YYReportPage()),
      UnitItemModel(
          '超时统计', 'images/home_home_sel.png', (cxt) => YYReportPage()),
      UnitItemModel(
          '绩效统计', 'images/home_home_sel.png', (cxt) => YYReportPage()),
      UnitItemModel(
          '人员超时', 'images/home_home_sel.png', (cxt) => YYReportPage()),
    ];
  }
}

//
class UnitItemModel {
  UnitItemModel(this.title, this.imageName, this.pageBuilder);
  String title;
  String imageName;
  WidgetBuilder pageBuilder;
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
