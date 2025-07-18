import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uas_smt3/assets/gambar.dart';
import 'package:uas_smt3/constants.dart';
import 'package:uas_smt3/controller/login_register_reset.dart';
import 'package:uas_smt3/screen/pembeli.dart';
import 'package:uas_smt3/screen/penjual.dart';
import 'package:uas_smt3/screen/register.dart';
import 'package:uas_smt3/screen/reset%20pass/forgot_password.dart';
import 'package:uas_smt3/widget/garis.dart';
import 'package:uas_smt3/widget/tombol.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static const id = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final LoginRegisterReset _login = LoginRegisterReset();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hallo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  'Selamat Datang Kembali',
                  style: TextStyle(color: kAbu, fontSize: 24),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: _email,
                    decoration:
                        kTextFieldDecoration.copyWith(label: Text('Email')),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: kTextFieldDecoration.copyWith(
                      label: Text('Password'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 425,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ForgotPassword.id);
                        },
                        child: Text('Lupa Password?'),
                      )
                    ],
                  ),
                ),
                TombolElevated(
                  tekan: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      // Login menggunakan email dan password
                      await _login.loginUsername(
                          email: _email.text, password: _password.text);

                      // Ambil user yang sedang login
                      var user = FirebaseAuth.instance.currentUser;

                      if (user != null) {
                        // Ambil data user dari Firestore
                        var snapshot = await FirebaseFirestore.instance
                            .collection(
                                'user') // Nama koleksi sesuai dengan Firestore Anda
                            .doc(user.uid)
                            .get();

                        if (snapshot.exists) {
                          // Ambil role dari dokumen Firestore
                          var role = snapshot.data()?['role'];

                          if (role == 'penjual') {
                            Navigator.pushNamed(context, HalamanPenjual.id);
                          } else if (role == 'pembeli') {
                            Navigator.pushNamed(context, HalamanPembeli.id);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Role tidak valid!')),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Data user tidak ditemukan!')),
                          );
                        }
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Gagal login: ${e.toString()}')),
                      );
                    } finally {
                      if (mounted) {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    }
                  },
                  kataKata: _isLoading ? 'Loading...' : 'Login',
                  warnaText: kPutih,
                  warnaTombol: kCoklat,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Garis(
                      jarakKiri: 65,
                      jarakKanan: 10,
                    ),
                    Text('Atau Lanjut Dengan'),
                    Garis(
                      jarakKiri: 10,
                      jarakKanan: 65,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      child: Image.asset(google),
                      onPressed: () async {
                        try {
                          await _login.loginGoogle();
                        } catch (e) {
                          if (mounted) {
                            setState(() {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(kSnackbar);
                            });
                          }
                        }
                      },
                    ),
                    TextButton(
                      child: Image.asset(instagram),
                      onPressed: () async {
                        try {
                          await _login.loginTwitter();
                        } catch (e) {
                          if (mounted) {
                            setState(() {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(kSnackbar);
                            });
                          }
                        }
                      },
                    ),
                    TextButton(
                      child: Image.asset(facebook),
                      onPressed: () async {
                        try {
                          await _login.loginFacebook();
                        } catch (e) {
                          if (mounted) {
                            setState(() {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(kSnackbar);
                            });
                          }
                        }
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bukan Anggota?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Register.id);
                      },
                      child: Text('Daftar Sekarang'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
