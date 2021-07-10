import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartschool_mobile/screens/dashboard.dart';
import 'package:smartschool_mobile/services/auth.dart';
import '../constants.dart';
import '../screens/screen.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../widgets/widget.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = true;
  bool _isLoading = false;

  Future<void> _loginUser(
      String email, String password, BuildContext context) async {
    Auth _auth = Provider.of<Auth>(context, listen: false);

    try {
      String result = await _auth.signIn(email, password);
      if (result == 'success') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => DashboardPage()),
            (Route<dynamic> route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result)));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Scaffold(
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
                                    height: 50,
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
                                    textFieldController: _emailController,
                                    hintText: 'Email',
                                    inputType: TextInputType.text,
                                  ),
                                  MyPasswordField(
                                    passwordController: _passwordController,
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
                              onTap: () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                await _loginUser(_emailController.text,
                                    _passwordController.text, context);
                                setState(() {
                                  _isLoading = false;
                                });
                              },
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
