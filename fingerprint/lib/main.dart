import 'package:fingerprint/pagetwo.dart';
import 'package:fingerprint/utils/authentication.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthenticationPage(),
    );
  }
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 28,
            ),
            Text(
              '"Use fingerprint to log into the app!',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 28,
            ),
            Divider(
              color: Colors.white60,
            ),
            SizedBox(
              height: 28,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                bool auth = await Authentication.authentication();
                print('Can authenticate: $auth');
                if (auth) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => secondpage()),
                  );
                }
              },
              icon: Icon(Icons.fingerprint),
              label: Text("Authenticate"),
            )
          ],
        ),
      )),
    );
  }
}
