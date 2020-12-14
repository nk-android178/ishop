import 'package:flutter/material.dart';
import 'package:ishop/services/ScreenAdapter.dart';
//import '../data/Config.dart';

class ProductList extends StatefulWidget {
  Map arguments;

  ProductList({Key key, this.arguments}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
//      body: Text("${widget.arguments}")
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: ScreenAdapter.width(180),
                      height: ScreenAdapter.height(180),
                      child: Image.network("src",fit: BoxFit.cover),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        child: Text("aaaa"),
                      ),
                    )
                  ],

                ),
                Divider()
              ],
            );
          }
        ),
      ),
    );
  }
}
