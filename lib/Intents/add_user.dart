import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moor_database/forms/registration.dart';

class AddUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddUser();
}

class _AddUser extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Add User"),
            leading: Icon(
              CupertinoIcons.back,
              color: Colors.deepPurple,
            ),
            trailing: Icon(
              CupertinoIcons.add,
              color: Colors.deepPurple,
            ),
          ),
          child: Registration(
            addUser:
                true, //true means this form is populated on Register User page
          )),
    );
  }
}
