import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../services/ScreenAdapter.dart';
import '../../data/ImageData.dart';
import '../../model/FocusModel.dart';

import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map> imgList = [
    {"url": "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1741067410,3185901984&fm=26&gp=0.jpg"},
    {"url": "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1627162812,3625349309&fm=26&gp=0.jpg"},
    {"url": "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2716828631,1254005294&fm=26&gp=0.jpg"}
  ];

  jiexi(){
    var str= '{"_id":"59f6ef443ce1fb0fb02c7a43","title":"笔记本电脑 ","status":"1"," url":"12" }';
    var focus = new FocusModel.fromJson(json.decode(str));
    print(focus.sId);
    print(focus.title);
  }


  Widget _swiperWidget() {
    return Container(
      child: AspectRatio(
          ///宽高比
          aspectRatio: 2 / 1,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                imgList[index]["url"],
                fit: BoxFit.fill,
              );
            },
            itemCount: imgList.length,
            /// 分页器
            pagination: new SwiperPagination(),
            ///自动轮播
            autoplay: true,
//      control: new SwiperControl(),
          )),
    );
  }

  Widget _titleWidget(value) {
    ///容器
    return Container(
      height: ScreenAdapter.height(32),
      //ScreenUtil().setHeight(32),
      margin: EdgeInsets.only(left: ScreenAdapter.width(20)),
      padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  color: Colors.red,
                  width: ScreenAdapter.height(10) //ScreenUtil().setWidth(10)
                  ))),
      child: Text(
        value,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  //热门商品
  Widget _hotProductListWidget() {
    return Container(
      height: ScreenAdapter.height(220),
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
//      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: ScreenAdapter.height(140),
                width: ScreenAdapter.width(140),
                margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
                child: Image.network(listdata[index]["imageurl"],
                    fit: BoxFit.cover),
              ),
              Text("第${index + 1}条")
            ],
          );
        },
        itemCount: listdata.length,
      ),
    );
  }

  ///推荐商品
  Widget _itemProductListWidget() {
    var itemWidth = (ScreenAdapter.getScreenWidth() - ScreenAdapter.width(32)) / 2;
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(10)),
      width: itemWidth,
      /// 边框
      decoration: BoxDecoration(
          border: Border.all(
              color: Color.fromRGBO(233, 233, 233, 0.9),
              width: ScreenAdapter.width(1))),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              child: AspectRatio( /// 设置宽高比
                aspectRatio: 1/1,
                child:  Image.network(
                    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1741067410,3185901984&fm=26&gp=0.jpg",
                    fit: BoxFit.cover)),
              ),
          Padding(
            padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
              child: Text(
                "2021啄木鸟男士夏季新款高支V领短袖t恤衫印花丝光棉纯色休闲打底衫潮",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54),
          )),
          Padding(
            padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("￥122",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16
                  )),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("￥192",
                      style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    jiexi();
//    ScreenUtil.init(context, designSize: Size(750, 1334));
    return ListView(
      children: [
        _swiperWidget(),
        SizedBox(height: ScreenAdapter.height(20)),
        _titleWidget("猜你喜欢"),
        SizedBox(height: ScreenAdapter.height(20)),
        _hotProductListWidget(),
        _titleWidget("热门推荐"),
        Container(
          padding: EdgeInsets.all(ScreenAdapter.width(10)),
          child: Wrap(
            runSpacing: ScreenAdapter.width(10),
            spacing: ScreenAdapter.width(10),
            children: [
              _itemProductListWidget(),
              _itemProductListWidget(),
              _itemProductListWidget(),
              _itemProductListWidget(),
              _itemProductListWidget(),
              _itemProductListWidget(),
              _itemProductListWidget(),
              _itemProductListWidget(),
            ],
          ),
        )
      ],
    );
  }
}
