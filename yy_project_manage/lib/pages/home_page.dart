import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:easy_listview/easy_listview.dart';

class YYhomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return YYHomeStatePage();
  }
}

class YYHomeStatePage extends State<YYhomePage> {
  List<String> _bannerUrls = [
    'http://imgs.ali213.net/IndexTJ/2019/03/21/20190321112445483.jpg',
    'http://via.placeholder.com/350x150'
  ];

  List _hotMessages = ['测试1', '测试2'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: EasyListView(
          headerBuilder: (BuildContext context) {
            return Column(
              children: <Widget>[
                Container(
                  height: 150,
                  child: _createBanner(),
                ),
                Container(
                  height: 40,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: _createHotView(),
                )
              ],
            );
          },
          itemCount: 18,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                _createSectionHeaderView('通知', index),
                _configCell(index),
              ],
            );
          },
          dividerBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.grey,
              height: 1,
            );
          }),
    );
  }

  //banner
  Swiper _createBanner() {
    return Swiper(
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          _bannerUrls[index],
          fit: BoxFit.fill,
        );
      },
      itemCount: _bannerUrls.length,
      pagination: new SwiperPagination(),
      control: null,
    );
  }

  //热点信息
  Swiper _createHotView() {
    return Swiper(
      scrollDirection: Axis.vertical,
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return Text(_hotMessages[index]);
      },
      itemCount: _hotMessages.length,
      pagination: null,
      control: null,
    );
  }
  //section header

  Offstage _createSectionHeaderView(String title, int index) {
    return Offstage(
      offstage: (index == 0 || index == 3) ? false : true,
      child: Row(
        children: <Widget>[
          Container(
            width: 4,
            height: 30,
            color: Colors.blue,
            margin: EdgeInsets.only(left: 10, top: 0, bottom: 0),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          FlatButton(
            child: Text('更多>'),
            onPressed: null,
          ),
        ],
      ),
    );
  }

  Widget _configCell(int index) {
    if (index < 3) {
      return _createNoticeCell();
    } else {
      return _createReportCell();
    }
  }

  // 通知 cell
  ListTile _createNoticeCell() {
    return ListTile(
      leading: Image.network(
          'http://b.hiphotos.baidu.com/image/pic/item/908fa0ec08fa513db777cf78376d55fbb3fbd9b3.jpg',
          fit: BoxFit.cover,
          width: 60,
        height: 50,
        ),
      title: Text('我是主题'),
      subtitle: Text('我是内容'),
      contentPadding: EdgeInsets.fromLTRB(20, 5, 20, 5),
    );
  }

  // 上报汇总 cell
  Container _createReportCell() {
    return Container(
        height: 90,
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 5, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('榆林区矿山地质',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('开工时间'),
                Text('能源'),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('开工时间'),
                Text('能源'),
              ],
            ),
          ],
        ));
  }
}
