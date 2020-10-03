import 'package:flutter/material.dart';
import '../pages/details/create_namedetails.dart';
import '../pages/create_name.dart';
import '../pages/loginandregister/login.dart';
import '../pages/loginandregister/register_first.dart';
import '../pages/loginandregister/register_sencond.dart';
import '../pages/base_navigator.dart';
import '../pages/home.dart';
import '../pages/remove_navigator.dart';



//配置路由
final  routes= {

/*
  "/":(context)=>Tabs(),
  "/form":(context)=>FormPage(),
  "/search":(context,{arguments})=>SearchPage(arguments:arguments),
  "/productinfo":(context,{arguments})=>ProductInfo(arguments:arguments),
  "/product":(context)=>Product(),
*/
  "/createnamedetails":(context,{arguments})=>CreateNameDetails(arguments:arguments),
  "/createname":(context)=>CreateName(),
  "/login":(context)=>Login(),
  "/registerfirst":(context)=>RegisterFirst(),
  "/registersencond":(context)=>RegisterSencond(),
  "/basenavigator":(context)=>BaseNavigator(),
  "/home":(context)=>Home(),
  "/removenavigator":(context)=>RemoveNavigator(),

};

//固定写法
   var    onGenerateRoute=(RouteSettings settings) {
// 统一处理
     final String name = settings.name;
     print("name  ----> " + name);
     final Function pageContentBuilder = routes[name];
     if (pageContentBuilder != null) {
       if (settings.arguments != null) {
         final Route route = MaterialPageRoute(
             builder: (context) =>
                 pageContentBuilder(context,
                     arguments: settings.arguments));
         return route;
       } else {
         final Route route = MaterialPageRoute(
             builder: (context) => pageContentBuilder(context));
         return route;
       }
     }
   };
