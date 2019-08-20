import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YYProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return YYProfileStatePage();
  }
}

class YYProfileStatePage extends State<YYProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      backgroundColor: Color.fromARGB(1, 222, 222, 222),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            height: 60,
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '张三',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _createUnit(Icons.lock, Colors.green, '修改密码'),
          SizedBox(
            height: 1,
          ),
          _createUnit(Icons.add_a_photo, Colors.yellow, '关于我们'),
          SizedBox(
            height: 10,
          ),
          _createUnit(Icons.share, Colors.red, '检查更新'),
          SizedBox(
            height: 1,
          ),
          _createUnit(Icons.message, Colors.green, '意见反馈'),
          SizedBox(
            height: 1,
          ),
          _createUnit(Icons.clear_all, Colors.green, '清理缓存'),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CupertinoButton(
                  child: Text(
                    '退出登录',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    _showExitDialog();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _showExitDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          '是否确认退出?',
        ),
        content: null,
        actions: <Widget>[
          CupertinoButton(
            child: Text('确定'),
            onPressed: ()=> Navigator.pop(context),
          ),
          CupertinoButton(
            child: Text('取消'),
            onPressed:()=> Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Container _createUnit(IconData icon, Color color, String text) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      height: 50,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
