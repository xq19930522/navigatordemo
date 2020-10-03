import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'dart:async';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
/*      routes: {
        "/select":(context)=>Select(),
        "/setting":(context)=>Setting()
      },*/
        onGenerateRoute:onGenerateRoute
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    int count = 0;
    const period = const Duration(seconds: 1);
    print('currentTime='+DateTime.now().toString());
    Timer.periodic(period, (timer) {
      //到时回调
      print('afterTimer='+DateTime.now().toString());
      count++;
      if (count >= 3) {
        //取消定时器，避免无限回调
        timer.cancel();
        timer = null;
        toHome();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  void  toHome()async{
    //Navigator.pushNamed(context, "/home");
    Navigator.of(context).pushNamedAndRemoveUntil(
        "/home", ModalRoute.withName("/home"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      color: Colors.green,
      child: Center(
        child: Text("app欢迎页",style: TextStyle(
            fontSize: 30,
            color: Colors.white
        ),
        ),
      ),
    );
  }
}

