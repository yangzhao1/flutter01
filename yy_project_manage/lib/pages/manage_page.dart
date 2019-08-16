import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class YYManagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return YYManageStatePage();
  }
}

class YYManageStatePage extends State<YYManagePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       body:  new Swiper(
        itemHeight: 150,
        itemWidth: 100,
        itemBuilder: (BuildContext context,int index){
          return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }

}