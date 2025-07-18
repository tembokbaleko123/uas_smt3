import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uas_smt3/firebase_options.dart';
import 'package:uas_smt3/screen/chat_screen/chat_screen.dart';
import 'package:uas_smt3/screen/home_login.dart';
import 'package:uas_smt3/screen/login.dart';
import 'package:uas_smt3/screen/logout.dart';
import 'package:uas_smt3/screen/pembeli.dart';
import 'package:uas_smt3/screen/penjual.dart';
import 'package:uas_smt3/screen/register.dart';
import 'package:uas_smt3/screen/reset%20pass/forgot_password.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLogin.id,
      routes: {
        HomeLogin.id: (context) => const HomeLogin(),
        Register.id: (context) => const Register(),
        Login.id: (context) => const Login(),
        Logout.id: (context) => const Logout(),
        ForgotPassword.id: (context) => const ForgotPassword(),
        HalamanPenjual.id: (context) => const HalamanPenjual(),
        HalamanPembeli.id: (context) => const HalamanPembeli(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}
