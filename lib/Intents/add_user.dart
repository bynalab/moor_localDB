import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moor_database/database/moor_database.dart';
import 'package:moor_database/widgets/months.dart';
import 'package:provider/provider.dart';

class AddUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddUser();
}

class _AddUser extends State<AddUser> {
  // DateTime _dateTime = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Text(
                      "Title   ",
                    ),
                  ),
                  Expanded(
                    child: CupertinoTextField(
                      controller: titleController,
                      prefix: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.title,
                          color: Colors.deepPurple,
                        ),
                      ),
                      placeholder: 'Mr.',
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Text(
                      "Name",
                    ),
                  ),
                  Expanded(
                    child: CupertinoTextField(
                      controller: nameController,
                      prefix: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.person_solid,
                          color: Colors.deepPurple,
                        ),
                      ),
                      placeholder: 'Abubakar Abdusalam',
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 45),
                    child: Text("Email"),
                  ),
                  Expanded(
                    child: CupertinoTextField(
                      controller: emailController,
                      prefix: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.mail_solid,
                          color: Colors.deepPurple,
                        ),
                      ),
                      placeholder: 'bynalabs@gmail.com',
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Text(
                      "Phone",
                    ),
                  ),
                  Expanded(
                    child: CupertinoTextField(
                      controller: phoneController,
                      prefix: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.phone_solid,
                          color: Colors.deepPurple,
                        ),
                      ),
                      placeholder: '+234701298668',
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              CupertinoButton(
                child: Text("Submit"),
                color: Colors.deepPurple,
                onPressed: () {
                  final db = Provider.of<UserDB>(context, listen: false);
                  final user = User(
                      id: null,
                      title: titleController.text,
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      status: true);
                  db.insertUser(user);
                  resetForm();
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void resetForm() {
    setState(() {
      titleController.clear();
      nameController.clear();
      emailController.clear();
      phoneController.clear();
    });
  }
}
