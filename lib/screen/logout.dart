import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uas_smt3/screen/home_login.dart';
import 'package:uas_smt3/widget/tombol.dart';

class Logout extends StatefulWidget {
  static const id = '/logout';
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TombolElevated(
              kataKata: 'Logout',
              tekan: () async {
                _auth.signOut();
                Navigator.popAndPushNamed(context, HomeLogin.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
