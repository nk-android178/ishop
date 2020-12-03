import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  int _selectIndex = 0;
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
        Container(
          height: double.infinity,
//          color: Colors.red,
          width: leftWidth,
          child: ListView.builder(
              itemCount: 28,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    InkWell( /// 可点击组件
                      onTap:(){
                        setState(() {
                          _selectIndex = index;
                        });
                      },
                      child: Container(
                        child: Text("第${index}",textAlign: TextAlign.center,),
                        color: _selectIndex == index?Colors.red:Colors.white,
                        width: double.infinity,
                        height: ScreenAdapter.height(56),
                      ),
                    ),
                    Divider()
                  ],
                );
              }
              )
        ),
        Expanded(///自适应布局
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
                itemCount: 18,
                itemBuilder: (context,index){
                  return Container(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1/1,
                          child: Image.network("https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1741067410,3185901984&fm=26&gp=0.jpg", fit: BoxFit.cover),
                          
                        ),
                        Container(
                          height: ScreenAdapter.height(28),
                          child: Text("女装"),
                        )
                      ],
                    ),
                  );
                }),
          )
        )
      ],
    );
  }
}
