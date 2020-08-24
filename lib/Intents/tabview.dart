import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moor_database/Intents/add_user.dart';
import 'package:moor_database/Intents/edit_user.dart';
import 'package:moor_database/Intents/view_users.dart';

class TabView extends StatefulWidget {
  // final String title;

  // AddUser({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TabView();
}

class _TabView extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // backgroundColor: Colors.deepPurple,
      tabBar: CupertinoTabBar(backgroundColor: CupertinoColors.white, items: [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add), title: Text("Add User")),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add), title: Text("View Users")),
        // BottomNavigationBarItem(
        //     icon: Icon(CupertinoIcons.eye), title: Text("Edit Users"))
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
        // return CupertinoTabView(
        //   builder: (context) {
        //     return CupertinoPageScaffold(
        //         // backgroundColor: CupertinoColors.white,
        //         navigationBar: CupertinoNavigationBar(
        //           middle: (index == 0) ? Text('Add User') : Text('View User'),
        //         ),
        //         child: Center(
        //           child: Text(
        //             'Bynalab $index!',
        //             style: CupertinoTheme.of(context)
        //                 .textTheme
        //                 .navLargeTitleTextStyle,
        //           ),
        //         ));
        //   },
        // );
      },
    );
  }
}
