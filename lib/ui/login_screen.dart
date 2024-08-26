import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_api/ui/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? username;
  String? password;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isSingnedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/FURNY_Green.png",
              height: 100,
              fit: BoxFit.cover,
            ),
            Text(
              'Login to your account',
              style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                  fontSize: 30,
                ),
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
                keyboardType: TextInputType.emailAddress,
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: GoogleFonts.openSans(),
                  border: const OutlineInputBorder(),
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
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: GoogleFonts.openSans(),
                  border: const OutlineInputBorder(),
                ),
                style: GoogleFonts.openSans(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // kondisi bila username null
                  if (usernameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Username field shouldn't be empty",
                        ),
                      ),
                    );
                  } else {
                    isSingnedIn = true;
                  }

                  if (passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Password field shouldn't be empty",
                        ),
                      ),
                    );
                  } else {
                    isSingnedIn = true;
                  }

                  if (usernameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(5.0),
                  backgroundColor: WidgetStateProperty.all(
                    Colors.green[600],
                  ),
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: ButtonStyle(
                elevation: WidgetStateProperty.all(5.0),
                backgroundColor: WidgetStateProperty.all(
                  Colors.red,
                ),
              ),
              child: Text(
                "Register",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
