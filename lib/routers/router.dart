import 'package:flutter/material.dart';
import 'package:ishop/pages/tabs/Tabs.dart';


final routes = {
  '/': (context) => Tabs()
};

//配置根组件命名路由传参
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments)
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context)
      );
      return route;
    }
  } else {
    final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context)
    );
    return route;
  }
};