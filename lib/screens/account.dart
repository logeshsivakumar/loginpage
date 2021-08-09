import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100.0),
              child: Center(
                child: Text(
                  "Account",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              child: Text(
                "You can have the Score instanly",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Container(
                child: Center(
              child: Image.asset("assets/images/account1.png"),
            )),
            SizedBox(
              height: 110.0,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(40.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFF6F00),
                  borderRadius: BorderRadius.circular(55.0),
                ),
                child: Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    ));
  }
}
