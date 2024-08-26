import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, this.username, this.password});

  final String? username;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.person,
              size: 100,
            ),
            Text(
              "Welcome $username!",
              style: GoogleFonts.openSans(
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              "Your password is $password",
              style: GoogleFonts.openSans(
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
