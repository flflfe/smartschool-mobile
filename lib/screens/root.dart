import 'package:smartschool_mobile/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:smartschool_mobile/services/auth.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  loading,
  notLoggedIn,
  loggedIn,
}

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  AuthStatus _authStatus = AuthStatus.loading;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    //get the state, check current User, set AuthStatus based on state
    Auth _auth = Provider.of<Auth>(context, listen: false);
    String _returnString = await _auth.onStartUp();
    print(_returnString);
    if (_returnString == "success") {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    } else {
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _authStatus == AuthStatus.loggedIn
        ? DashboardPage()
        : _authStatus == AuthStatus.notLoggedIn
            ? WelcomePage()
            : Scaffold(
                body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              ));
  }
}
