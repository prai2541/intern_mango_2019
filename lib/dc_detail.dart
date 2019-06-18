import 'dart:io';

import 'package:app_ui/employeeDetail.dart';
import 'package:app_ui/newDCEntry.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:image_picker/image_picker.dart';

import 'editDCEntry.dart';

List<String> name = [
  "Suzanne	Steele",
  'Lila	Cummings',
  'Joe	Young',
  'Samuel	Barker'
];

List<String> status = ["DONE", "ADD", "ADD", "DONE"];

class DCDetail extends StatelessWidget {
  String getDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('d MMMM y');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white.withOpacity(0.75),
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false);
                  },
                )
              ],
              bottom: TabBar(
                indicatorColor: Color(0xFFB8001C),
                indicatorWeight: 3.0,
                labelColor: Color(0xFFB8001C),
                labelStyle: TextStyle(fontSize: 18),
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(child: Text(getDate().toUpperCase())),
                  Tab(child: Text('DETAIL')),
                ],
              ),
              title: Text(
                'DC SYSTEM',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: ListBody(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 10, bottom: 1),
                        child: Text(
                          'Project : 202019',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, bottom: 1),
                        child: Text(
                          'Project Name : สโตร์กลาง',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, bottom: 1),
                        child: Text(
                          'Job : CML',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'ผู้ตรวจ : ผู้ตรวจการ ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[ListTabView(), DetailTabView()],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class ListTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListTabViewState();
  }
}

class _ListTabViewState extends State<ListTabView> {
  deleteCallback(int index) {
    setState(() {
      name.removeAt(index);
      status.removeAt(index);
    });
  }

  doneCallback(int index) {
    setState(() {
      status[index] = 'DONE';
    });
  }

  Color colorStatus(String status) {
    switch (status) {
      case 'DONE':
        {
          return Color(0xFF42957c);
        }
        break;

      case 'ADD':
        {
          return Color(0xFFf6ca6b);
        }
    }
  }

  Color textColor(String status) {
    switch (status) {
      case 'DONE':
        {
          return Color(0xFF66c1a9);
        }
        break;

      case 'ADD':
        {
          return Color(0xFFf6cb6f);
        }
    }
  }

  Future<void> _deleteAlert(index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Would you like to delete this data?'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'YES',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  name.removeAt(index);
                  status.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
                child: Text(
                  'NO',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }

  getActionButton(String status, index) {
    switch (status) {
      case 'DONE':
        {
          return <Widget>[
            Container(
              padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
              child: IconSlideAction(
                  caption: 'Edit',
                  color: Color(0xfff5b62d),
                  icon: Icons.edit,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        settings: RouteSettings(name: '/dc-system/detail/edit'),
                        builder: (context) => new EditDCEntry()));
                  }),
            ),
            Container(
              padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
              child: IconSlideAction(
                  caption: 'DELETE',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    _deleteAlert(index);
                  }),
            )
          ];
        }
        break;

      case 'ADD':
        {
          return <Widget>[
            Container(
              padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
              child: IconSlideAction(
                  caption: 'Add',
                  color: Color(0xff718996),
                  icon: Icons.add_box,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        settings: RouteSettings(name: '/dc-system/detail/add'),
                        builder: (context) =>
                            new NewDCEntryL(doneCallback, index)));
                  }),
            )
          ];
        }
    }
  }

  final SlidableController slidableController = SlidableController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, i) {
          return Slidable(
            controller: slidableController,
            actionExtentRatio: 0.20,
            actionPane: SlidableScrollActionPane(),
            child: Card(
                child: ListTile(
              contentPadding: EdgeInsets.only(right: 20),
              leading: Container(
                width: 10,
                color: colorStatus(status[i]),
              ),
              title: Text(
                name[i],
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                status[i],
                style: TextStyle(color: textColor(status[i])),
              ),
            )),
            secondaryActions: getActionButton(status[i], i),
          );
        });
  }
}

class DetailTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailTabViewState();
  }
}

class _DetailTabViewState extends State<DetailTabView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, i) {
          return Card(
              child: ListTile(
            leading: CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/25e384a9-c599-45c5-bc56-929c3111276c/d6k8a2r-3391ff86-4af8-4695-bfad-14350ae04bfe.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI1ZTM4NGE5LWM1OTktNDVjNS1iYzU2LTkyOWMzMTExMjc2Y1wvZDZrOGEyci0zMzkxZmY4Ni00YWY4LTQ2OTUtYmZhZC0xNDM1MGFlMDRiZmUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Bx0q3W1dS8p6f8DSiUCPrjHzt4LWxhJQw0d3k0Qz06Q'),
            ),
            title: Text(name[i]),
            subtitle: Row(
              children: <Widget>[
                Text('Working Day :'),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Badge(
                    badgeColor: Colors.red,
                    borderRadius: 5,
                    padding:
                        EdgeInsets.only(top: 1, bottom: 1, left: 7, right: 7),
                    shape: BadgeShape.square,
                    badgeContent: Text(
                      '5',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                Text('Days')
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => new EmployeeDetail(name[i])));
            },
          ));
        });
  }
}