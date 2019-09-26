import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

Color themeTextColor = Color.fromARGB(255, 90, 90, 90);
Color themeColor = Color.fromARGB(255, 4, 104, 255);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _val = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: themeTextColor),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.share, color: themeTextColor),
                onPressed: () {})
          ],
        ),
        body: Container(
            color: Colors.white,
            child: Column(children: <Widget>[
              ///中心旋转图片
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                      flex: 8,
                      child: Center(
                          child: Stack(children: <Widget>[
                        Image.asset('images/discplus.png'),
                        Container(
                            margin: EdgeInsets.all(40),
                            child: ClipOval(
                              child: Image.asset('images/bg.jpg'),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: themeColor.withOpacity(0.4),
                                      blurRadius: 8.0)
                                ]))
                      ]))),
                  Expanded(flex: 1, child: SizedBox())
                ],
              )),
              SizedBox(height: 20),
              Text("光年之外",
                  style: TextStyle(color: themeTextColor, fontSize: 26)),
              Text("邓紫棋",
                  style: TextStyle(
                      color: themeTextColor.withOpacity(0.5), fontSize: 18)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: themeTextColor.withOpacity(0.2), width: 1),
                          borderRadius: BorderRadius.circular(18)),
                      child: Text("标准"),
                      onPressed: () {}),
                  SizedBox(width: 10),
                  FlatButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: themeTextColor.withOpacity(0.2), width: 1),
                          borderRadius: BorderRadius.circular(18)),
                      child: Text("音效"),
                      onPressed: () {}),
                  SizedBox(width: 10),
                  FlatButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: themeTextColor.withOpacity(0.2), width: 1),
                          borderRadius: BorderRadius.circular(18)),
                      child: Text("写真"),
                      onPressed: () {})
                ],
              ),
              SizedBox(height: 10),

              ///喜欢 - 下载 - 评论 - 更多
              Row(children: <Widget>[
                Expanded(
                    child: IconButton(
                        icon: Icon(Icons.favorite_border,
                            color: themeTextColor.withOpacity(0.75)),
                        onPressed: () {})),
                Expanded(
                    child: IconButton(
                        icon: Icon(Icons.file_download,
                            color: themeTextColor.withOpacity(0.75)),
                        onPressed: () {})),
                Expanded(
                    child: IconButton(
                        icon: Icon(Icons.bluetooth_audio,
                            color: themeTextColor.withOpacity(0.75)),
                        onPressed: () {})),
                Expanded(
                    child: IconButton(
                        icon: Icon(Icons.more_vert,
                            color: themeTextColor.withOpacity(0.75)),
                        onPressed: () {}))
              ]),
              SizedBox(height: 10),
              Row(children: <Widget>[
                SizedBox(width: 30),
                Text("00:48",
                    style: TextStyle(color: themeTextColor.withOpacity(0.75))),
                Expanded(
                    child: Slider(
                        onChanged: (double value) {
                          setState(() {
                            _val = value;
                          });
                        },
                        value: _val,
                        max: 100)),
                Text("04:02",
                    style: TextStyle(color: themeTextColor.withOpacity(0.75))),
                SizedBox(width: 30)
              ]),
              SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.filter_vintage,
                            color: themeTextColor.withOpacity(0.75)),
                        onPressed: () {}),
                    CupertinoButton(
                        padding: EdgeInsets.all(0),
                        color: Color.fromARGB(255, 247, 247, 247),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Icon(Icons.skip_previous,
                            color: themeColor.withOpacity(0.75)),
                        onPressed: () {}),
                    CupertinoButton(
                        padding: EdgeInsets.all(10),
                        color: themeColor,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Icon(Icons.play_arrow,
                            size: 48, color: Colors.white),
                        onPressed: () {}),
                    CupertinoButton(
                        padding: EdgeInsets.all(0),
                        color: Color.fromARGB(255, 247, 247, 247),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Icon(Icons.skip_next,
                            color: themeColor.withOpacity(0.75)),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.playlist_play,
                            color: themeTextColor.withOpacity(0.75)),
                        onPressed: () {})
                  ]),
              SizedBox(height: 30)
            ])));
  }
}
