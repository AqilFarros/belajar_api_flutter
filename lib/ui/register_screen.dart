import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_api/ui/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  bool isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/FURNY_Green.png",
              height: 100,
              fit: BoxFit.cover,
            ),
            Text(
              "Register to create an account",
              style: GoogleFonts.ubuntu(
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: GoogleFonts.openSans(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: GoogleFonts.openSans(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: firstName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: GoogleFonts.openSans(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: lastName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: GoogleFonts.openSans(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: GoogleFonts.openSans(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: GoogleFonts.openSans(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[600],
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            if (email.text.isEmpty ||
                                firstName.text.isEmpty ||
                                lastName.text.isEmpty ||
                                password.text.isEmpty) {
                              isSignedIn = false;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("All field shouldn't be empty."),
                                ),
                              );
                            } else if (!email.text.contains('@')) {
                              isSignedIn = false;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "The email filed should be an email."),
                                ),
                              );
                            } else if (password.text.length < 8) {
                              isSignedIn = false;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Password length should be at least 8 characters.",
                                  ),
                                ),
                              );
                            } else {
                              isSignedIn = true;

                              if (email.text.isNotEmpty &&
                                  firstName.text.isNotEmpty &&
                                  lastName.text.isNotEmpty &&
                                  password.text.isNotEmpty) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(
                                      username: email.text,
                                      firstName: firstName.text,
                                      lastName: lastName.text,
                                      password: password.text,
                                    ),
                                  ),
                                  (route) => false,
                                );
                              }
                            }
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Register',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
