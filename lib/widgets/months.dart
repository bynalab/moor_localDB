import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MonthPopup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MonthPopup();
}

class _MonthPopup extends State<MonthPopup> {
  var _selectedMonth = "Select Month";
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Text(_selectedMonth),
        onPressed: () {
          showCupertinoModalPopup<int>(
              context: context,
              builder: (context) {
                return CupertinoActionSheet(
                  cancelButton: CupertinoActionSheetAction(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text("Select Month"),
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      onPressed: () {
                        setState(() {
                          _selectedMonth = "January";
                        });
                        Navigator.pop(context, 1);
                      },
                      child: Text("January"),
                      isDefaultAction: true,
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context, 2);
                        setState(() {
                          _selectedMonth = "February";
                        });
                      },
                      child: Text("February"),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        setState(() {
                          _selectedMonth = "March";
                        });
                        Navigator.pop(context, 3);
                      },
                      child: Text("March"),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        setState(() {
                          _selectedMonth = "April";
                        });
                        Navigator.pop(context, 4);
                      },
                      child: Text("April"),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        setState(() {
                          _selectedMonth = "May";
                        });
                        Navigator.pop(context, 5);
                      },
                      child: Text("May"),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context, 6);
                      },
                      child: Text("June"),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context, 7);
                      },
                      child: Text("July"),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context, 8);
                      },
                      child: Text("August"),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context, 9);
                      },
                      child: Text("September"),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context, 10);
                      },
                      child: Text("October"),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context, 11);
                      },
                      child: Text("November"),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context, 12);
                      },
                      child: Text("December"),
                    )
                  ],
                );
              });
        });
  }
}
