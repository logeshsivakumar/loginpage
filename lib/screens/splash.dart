import 'package:flutter/material.dart';
import 'package:loginpage/screens/account.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _pageState = 0;
  var _bgColor = Colors.white;
  var _hdColor = Colors.black;

  double _headingTop = 100;
  double _loginHeight = 0;
  double _registerHeight = 0;
  double _loginWidth = 0;
  double _loginOpacity = 1;

  double _loginXOffset = 0;
  double _loginYOffset = 0;
  double _registerYOffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;
  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        _keyboardVisible = visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch (_pageState) {
      case 0:
        _bgColor = Colors.white;
        _hdColor = Colors.black;

        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginXOffset = 0;
        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        _registerYOffset = windowHeight;

        break;
      case 1:
        _bgColor = Color(0xFFFF6F00);
        _hdColor = Colors.white;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginXOffset = 0;
        _loginYOffset = _keyboardVisible ? 40 : 270;

        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _registerYOffset = windowHeight;
        break;
      case 2:
        _bgColor = Color(0xFFFF6F00);
        _hdColor = Colors.white;

        _headingTop = 80;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _loginXOffset = 20;
        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 250;
        _registerYOffset = _keyboardVisible ? 50 : 270;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        break;
    }
    return Stack(children: [
      GestureDetector(
        onTap: () {
          setState(() {
            _pageState = 0;
          });
        },
        child: AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 5000),
          color: _bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AnimatedContainer(
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: Duration(milliseconds: 1000),
                    margin: EdgeInsets.only(top: _headingTop),
                    child: Center(
                      child: Text(
                        "Score Board",
                        style: TextStyle(
                          color: _hdColor,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: Text(
                      "Get live updates of all the Sports Scores",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _hdColor,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                child: Center(
                  child: Image.asset("assets/images/splash1.png"),
                ),
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_pageState != 0) {
                      _pageState = 0;
                    } else {
                      _pageState = 1;
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(40.0),
                  padding: EdgeInsets.all(20.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFFF6F00),
                      borderRadius: BorderRadius.circular(55)),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
      AnimatedContainer(
        padding: EdgeInsets.all(20),
        width: _loginWidth,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 1000),
        transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(_loginOpacity),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 18),
              child: Text(
                "Login To Continue",
                style: TextStyle(
                  color: Color(0xFFFF6F00),
                  fontSize: 26.0,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Icon(Icons.email),
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter Email..."),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Icon(Icons.password),
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Password..."),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 130.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFFF6F00),
                  borderRadius: BorderRadius.circular(55)),
              child: Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFFF6F00),
                  ),
                  borderRadius: BorderRadius.circular(55)),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 2;
                    });
                  },
                  child: Text(
                    "Create new Account",
                    style: TextStyle(
                      color: Color(0xFFFF6F00),
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 1000),
        transform: Matrix4.translationValues(0, _registerYOffset, 1),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 18),
              child: Text(
                "Create new Account",
                style: TextStyle(
                  color: Color(0xFFFF6F00),
                  fontSize: 26.0,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Icon(Icons.email),
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter Email..."),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Icon(Icons.password),
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Password..."),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 130.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFFF6F00),
                  borderRadius: BorderRadius.circular(55)),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Account()));
                  },
                  child: Text(
                    "Create new Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFFF6F00),
                  ),
                  borderRadius: BorderRadius.circular(55)),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 1;
                    });
                  },
                  child: Text(
                    "Back to Login",
                    style: TextStyle(
                      color: Color(0xFFFF6F00),
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
