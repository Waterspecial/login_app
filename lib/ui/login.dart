import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {

  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String welcomeString = "";



  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            //image Profile
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.white,
            ),
            new Container(
              width: 380.0,
              height: 180.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: 'Username',
                      icon: new Icon(Icons.person),
                    ),
                  ),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(10.5)),
                  new Center(
                      child: new Row(
                    children: <Widget>[
                      //Login
                      new Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: new RaisedButton(
                              onPressed: _showWelcome,
                              color: Colors.redAccent,
                              child: new Text("Login",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 16.9)))),
                      new Container(
                        margin: const EdgeInsets.only(left: 120.0),
                        child: new RaisedButton(
                          onPressed: _erase,
                          color: Colors.redAccent,
                          child: new Text("Clear",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16.9)),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(14.0)),// forms end
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Welcome, $welcomeString",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500,
                ),)
              ],
            )
          ],
        ), //form ends
      ),
    );
  }
  void _showWelcome() {
    setState(() {
      if(_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        welcomeString = _userController.text;
      }else {
        welcomeString = "Nothing";
      }
    });
  }
}
