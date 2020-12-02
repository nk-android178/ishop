import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

///封装设置不同设备宽高
class ScreenAdapter{

  static init(context){
    ScreenUtil.init(context, designSize: Size(750, 1334));
  }
  static height(double value){
    return ScreenUtil().setHeight(value);
  }
  static width(double value){
    return ScreenUtil().setWidth(value);
  }
  ///当前设备高度 dp
  static getScreenHeight(){
    return ScreenUtil().screenHeight;
  }
  /// 当前设备宽度 dp
  static getScreenWidth(){
    return ScreenUtil().screenWidth;
  }
}