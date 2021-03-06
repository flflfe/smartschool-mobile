import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartschool_mobile/screens/dashboard.dart';
import 'package:smartschool_mobile/screens/screen.dart';
import 'package:smartschool_mobile/services/auth.dart';
import 'package:smartschool_mobile/services/services.dart';
import 'package:smartschool_mobile/screens/login.dart';
import 'package:smartschool_mobile/screens/signup.dart';
import 'package:smartschool_mobile/screens/root.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';

main() => runApp(Smartschool());

class Smartschool extends StatefulWidget {
  @override
  _SmartschoolState createState() => _SmartschoolState();
}

class _SmartschoolState extends State<Smartschool> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => Services()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: Colors.transparent,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/dashboard': (context) => DashboardPage(),
          '/login': (context) => SignInPage(),
          '/signup': (context) => RegisterPage(),
          '/root': (context) => Root(),
        },
        // home: Root(),
        home: Root(),
        // home: WelcomePage(),
      ),
    );
  }
}
