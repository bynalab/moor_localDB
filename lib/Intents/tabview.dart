import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moor_database/Intents/add_user.dart';
import 'package:moor_database/Intents/edit_user.dart';
import 'package:moor_database/Intents/view_users.dart';

class TabView extends StatefulWidget {

  AddUser({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TabView();
}

class _TabView extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(backgroundColor: CupertinoColors.white, items: [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add), title: Text("Add User")),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add), title: Text("View Users")),
      ]),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return AddUser();
            break;
          case 1:
            return ViewUser();
            break;
          case 2:
            return EditUser();
            break;
          default:
            return Text("Users");
            break;
        }
      },
    );
  }
}
