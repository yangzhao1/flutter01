import 'package:flutter/material.dart';

class YYReportPage extends StatelessWidget{
  YYReportPage({this.titleString});

  final String titleString;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(titleString),
      ),
      body: Text('data'),
    );
  }
}