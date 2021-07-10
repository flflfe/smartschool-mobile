import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/screen.dart';
import '../widgets/widget.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Hackathonbg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Text(
                        "Codekavya SmartSchool",
                        style: kHeadline,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          "A Hackathon Project.",
                          style: kBodyText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        // height: 300,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            MyTextButton(
                              bgColor: Colors.white,
                              buttonName: 'Register',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                              textColor: Colors.black87,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            MyTextButton(
                              bgColor: Colors.white,
                              buttonName: 'Login',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => SignInPage(),
                                    ));
                              },
                              textColor: Colors.black87,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
