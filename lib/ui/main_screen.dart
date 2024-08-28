import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_api/model/users.dart';
import 'package:project_api/service/api_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    this.username,
    this.password,
    this.firstName,
    this.lastName,
  });

  final String? username;
  final String? password;
  final String? firstName;
  final String? lastName;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Future<List<Users>?> users = ApiService().getUsers();

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
              "Welcome ${widget.username}!",
              style: GoogleFonts.openSans(
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              "Your password is ${widget.password}",
              style: GoogleFonts.openSans(
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              "Your first name is ${widget.firstName}",
              style: GoogleFonts.openSans(
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              "Your last name is ${widget.lastName}",
              style: GoogleFonts.openSans(
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<Users>?>(
                future: users,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text("Users is not found!"),
                    );
                  } else {
                    return SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return GiffyDialog.image(
                                    Image.network(
                                      "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text(
                                      'Image Animation',
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Text(
                                      'This is a image animation dialog box. This library helps you easily create fancy giffy dialog.',
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'CANCEL'),
                                        child: const Text('CANCEL'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.green[600],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      snapshot.data![index].id.toString(),
                                      style: GoogleFonts.merriweather(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    snapshot.data![index].name.toString(),
                                    style: GoogleFonts.openSans(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                        "Username:",
                                        style: GoogleFonts.openSans(),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        snapshot.data![index].username
                                            .toString(),
                                        style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
