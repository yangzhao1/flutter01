import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yy_project_manage/networks/http_api.dart';
import 'package:yy_project_manage/pages/main_tabbar_page.dart';

class YYLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoninStatePage();
}

class LoninStatePage extends State<StatefulWidget> {
  final double _offsetY = 20;
  final double _unitH = 50;
  final double _lrOffset = 50;

  String _userName = '';
  String _password = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        // color: Colors.red,
        padding: new EdgeInsets.only(top: 60),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('images/login_bg.png'),
          ),
        ),
        child: new ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _createTopIcon(),
              //
              _createInput(),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _createTopIcon() {
    return new Positioned(
      top: 30,
      child: new Image(
        width: 308,
        height: 80,
        image: AssetImage('images/login_title.png'),
      ),
    );
  }

  Column _createInput() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          width: double.infinity,
          height: _unitH,
          margin: EdgeInsets.fromLTRB(_lrOffset, 0, _lrOffset, 0),
          decoration: new BoxDecoration(
              border: new Border.all(width: 1, color: Colors.white),
              color: Colors.white,
              borderRadius: new BorderRadius.circular(6)),
          child: _createUserName(),
        ),
        new Container(
            width: double.infinity,
            height: _unitH,
            margin: EdgeInsets.fromLTRB(_lrOffset, _offsetY, _lrOffset, 0),
            decoration: new BoxDecoration(
                border: new Border.all(width: 1, color: Colors.white),
                color: Colors.white,
                borderRadius: new BorderRadius.circular(6)),
            child: _createPassword()),
        new Container(
          width: double.infinity,
          height: _unitH,
          margin: EdgeInsets.fromLTRB(_lrOffset, _offsetY * 2, _lrOffset, 0),
          decoration: new BoxDecoration(
              border: new Border.all(width: 1, color: Colors.white),
              color: Colors.white,
              borderRadius: new BorderRadius.circular(6)),
          child: _loginButton(),
        )
      ],
    );
  }

  TextField _createPassword() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: "请输入密码",
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
      obscureText: true,
      onChanged: (text) {
        _password = text;
      },
    );
  }

  TextField _createUserName() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: "请输入账号",
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
      onChanged: (text) {
        _userName = text;
      },
    );
  }

  Container _loginButton() {
    return new Container(
      width: double.infinity,
      child: new RaisedButton(
        color: Colors.white,
        onPressed: _clickLogin,
        textColor: Colors.blue,
        child: Text(
          '登录',
          style: TextStyle(color: Colors.blue, fontSize: 18),
        ),
      ),
    );
  }

  void _clickLogin() {
    print('登录' + '$_userName' + '$_password');
    HttpApi.httpLogin(_userName, _password, (respone) {
      // print("respone" + respone.jsonData + respone.message);
      pushHomePage();
    });
  }

  void pushHomePage(){
    Navigator.pushReplacement(context, CupertinoPageRoute(builder:(context)=>YYMainPage()));
  }
}
