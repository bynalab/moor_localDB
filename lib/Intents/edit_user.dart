import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditUser();
}

class _EditUser extends State<EditUser> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Edit User"),
          leading: Icon(CupertinoIcons.back),
          trailing: Icon(CupertinoIcons.add),
        ),
        child: Center(
          child: Text(
            "Edit User",
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
        ));
  }
}
