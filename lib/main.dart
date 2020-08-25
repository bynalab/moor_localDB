import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moor_database/Intents/tabview.dart';
import 'package:moor_database/database/moor_database.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => UserDB(),
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData.raw(Brightness.light, Colors.black,
            Colors.white, CupertinoTextThemeData(), Colors.white, Colors.white),
        home: TabView(),
      ),
    );
  }
}
