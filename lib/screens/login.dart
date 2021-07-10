import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/screen.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../widgets/widget.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image(
            width: 24,
            color: Colors.white,
            image: Svg('assets/images/back_arrow.svg'),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Hackathonbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          //to make page scrollable
          child: CustomScrollView(
            reverse: true,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Login",
                              style: kHeadline,
                            ),

                            // Text(
                            //   "Login",
                            //   style: kBodyText2,
                            // ),
                            SizedBox(
                              height: 60,
                            ),
                            MyTextField(
                              hintText: 'Email',
                              inputType: TextInputType.text,
                            ),
                            MyPasswordField(
                              isPasswordVisible: isPasswordVisible,
                              onTap: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont't have an account? ",
                            style: kBodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Register',
                              style: kBodyText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextButton(
                        buttonName: 'Sign In',
                        onTap: () {},
                        bgColor: Colors.white,
                        textColor: Colors.black87,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
