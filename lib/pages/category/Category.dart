import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';
import '../../data/Config.dart';
import 'package:dio/dio.dart';
import '../../model/CateModel.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  int _selectIndex = 0;
  List _leftList = [];
  List _rightList = [];

  @override
  void initState(){
    super.initState();
    _getLeftDate();
  }

  _getLeftDate() async{
    var api = '${Config.Api}api/pcate';
    var _focusData = await Dio().get(api);
    print(_focusData.data);
    var leftList = new CateModel.fromJson(_focusData.data);
    setState(() {
      this._leftList = leftList.result;
    });
    if(leftList.result.length > 0){
      _getRightDate(leftList.result[0].sId);
    }
  }
  _getRightDate(pid) async{
    var api = '${Config.Api}api/pcate?pid=${pid}';
    var _focusData = await Dio().get(api);
    print(_focusData.data);
    var rightList = new CateModel.fromJson(_focusData.data);
    setState(() {
      this._rightList = rightList.result;
    });
  }

  Widget _leftWidget(leftWidth){
    if(this._leftList.length > 0){
      return Container(
          height: double.infinity,
//          color: Colors.red,
          width: leftWidth,
          child: ListView.builder(
              itemCount: this._leftList.length,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    InkWell( /// 可点击组件
                      onTap:(){
                        setState(() {
                          _selectIndex = index;
                          this._getRightDate(this._leftList[index].sId);
                        });
                      },
                      child: Container(
                        child: Text("${this._leftList[index].title}",textAlign: TextAlign.center,),
                        color: _selectIndex == index?Color.fromRGBO(240,246,246, 0.9):Colors.white,
                        width: double.infinity,
                        height: ScreenAdapter.height(84),
                        padding: EdgeInsets.only(top: ScreenAdapter.height(25)),
                      ),
                    ),
                    Divider(height: 1,) ///分割线 有默认高度
                  ],
                );
              }
          )
      );
    } else {
      return Container( ///返回空的容器
        width: leftWidth,
        height: double.infinity
      );
    }

  }

  Widget _rightCateWidget(rightItemWidth, rightItemHeight){
    if(this._rightList.length > 0){
      return Expanded(///自适应布局
          flex: 1,
          child:  Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            color: Color.fromRGBO(240,246,246, 0.9),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, /// 列数
                    childAspectRatio: rightItemWidth/rightItemHeight,  //1/1.2, /// 宽高比
                    crossAxisSpacing: 10, /// 纵轴
                    mainAxisSpacing: 10 ///主轴
                ),
                itemCount: this._rightList.length,
                itemBuilder: (context,index){
                  ///处理图片
                  String pic = this._rightList[index].pic;
                  pic = Config.Api+pic.replaceAll('\\', '/');
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/productlist',arguments: {
                        "cid":this._rightList[index].sId
                      });
                    },
                    child: Container(
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1/1,
                            child: Image.network(pic, fit: BoxFit.cover),
                          ),
                          Container(
                            height: ScreenAdapter.height(28),
                            child: Text("${this._rightList[index].title}"),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
      );
    } else {
      return Expanded(///自适应布局
          flex: 1,
          child:  Container(
              padding: EdgeInsets.all(10),
              height: double.infinity,
              color: Color.fromRGBO(240,246,246, 0.9),
              child: Text("加载中..."),
          )
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    /// 计算右侧GridView宽高比

    var leftWidth = ScreenAdapter.getScreenWidth()/4;
    /// 右侧宽度 = 总宽度 - 左侧宽度 - GridView外侧原生左右的padding值 - gridview的中间值
    var rightItemWidth = (ScreenAdapter.getScreenWidth() - leftWidth - 20 - 20)/3;
    rightItemWidth = ScreenAdapter.width(rightItemWidth);
    var rightItemHeight = rightItemWidth + ScreenAdapter.height(28);
    return Row(
      children: [
        _leftWidget(leftWidth),
        _rightCateWidget(rightItemWidth, rightItemHeight)
      ],
    );
  }
}
