import 'package:flutter/material.dart';
import './main.dart';

class PortalPopup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget portalButton(String name, destination ) {
    Route route = MaterialPageRoute(builder: (context) => destination);
    return GestureDetector(
      onTap: () {
        if(name == 'HOME') {
          Navigator.pop(context);
          print('$name is tapped');
        } else if(destination != null) {
          Navigator.of(context).push(route);
          print('$name is tapped');
        } else {
          print('$name is tapped');
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        child: Text(
          '$name',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

    return Scaffold(
        backgroundColor: Color(0xFF001E1E).withOpacity(0.90),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  portalButton('HOME', MyApp()),
                  portalButton('PROFILE', null),
                  portalButton('NOTIFICATION', null),
                  portalButton('ABOUT', null),
                  portalButton('LOG OUT', null),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 60.0),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(children: <Widget> [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close, 
                        color: Color(0xFF1A3638),
                        size: 35.0,),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text('Cancel',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ])   
              )
            )
          ],
        ));
  }
}