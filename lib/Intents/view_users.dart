import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:moor_database/database/moor_database.dart';
import 'package:moor_database/forms/registration.dart';
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
          },
        );
      },
    );
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
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 800,
                  child: CupertinoPopupSurface(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Editing ' + user.name,
                          style: TextStyle(
                              // color: Colors.deepPurple,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                        Registration(
                          id: user.id,
                          title: user.title,
                          name: user.name,
                          email: user.email,
                          phone: user.phone,
                        ),
                        CupertinoButton(
                          child: Text("Cancel"),
                          color: Colors.red,
                          onPressed: () {
                            Navigator.pop(context);
                            // resetForm();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
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
            ),
          ),
        ),
      ),
    );
  }
}
