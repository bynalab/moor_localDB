import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:moor_database/database/moor_database.dart';
import 'package:provider/provider.dart';

class ViewUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewUser();
}

class _ViewUser extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("All Users"),
        leading: Icon(CupertinoIcons.back),
        trailing: Icon(CupertinoIcons.add),
      ),
      child: _buildUsers(context),
    );
  }

  StreamBuilder<List<User>> _buildUsers(BuildContext context) {
    final db = Provider.of<UserDB>(context);
    return StreamBuilder(
        stream: db.watchUsers(),
        builder: (context, AsyncSnapshot<List<User>> snapshot) {
          final users = snapshot.data ?? List();

          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, index) {
                final usersList = users[index];
                return _buildUsersList(usersList, db);
              });
        });
  }

  Widget _buildUsersList(User user, UserDB db) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.black45,
          icon: Icons.edit,
          onTap: () {},
        ),
        IconSlideAction(
            caption: 'Delete',
            color: CupertinoColors.destructiveRed,
            icon: Icons.delete,
            onTap: () => db.deleteUser(user)),
      ],
      child: Card(
        child: InkWell(
          onTap: () {},
          child: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                user.name,
                style: TextStyle(fontSize: 20),
              )),
        ),
      ),
    );
  }
}
