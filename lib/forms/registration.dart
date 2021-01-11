import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moor_database/database/moor_database.dart';
import 'package:provider/provider.dart';

class Registration extends StatefulWidget {
  final String title;
  final String name;
  final String email;
  final String phone;
  final int id;
  final bool addUser;

  Registration(
      {Key key,
      this.title,
      this.name,
      this.email,
      this.phone,
      this.id,
      @required this.addUser})
      : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  controller: titleController ?? titleController
                    ..text = widget.title,
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
                  controller: nameController ?? nameController
                    ..text = widget.name,
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
                  controller: emailController ?? emailController
                    ..text = widget.email,
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
                  controller: phoneController ?? phoneController
                    ..text = widget.phone,
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.phone_solid,
                      color: Colors.deepPurple,
                    ),
                  ),
                  placeholder: '+2347012986**',
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
              if (widget.addUser) {
                db.insertUser(user);
                resetForm();
              } else {
                db.updateUser(
                  user.copyWith(
                      id: widget.id,
                      title: titleController.text,
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text),
                );
                Navigator.pop(context);
              }
            },
          ),
          SizedBox(height: 20),
        ],
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
