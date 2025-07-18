import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uas_smt3/assets/gambar.dart';
import 'package:uas_smt3/constants.dart';
import 'package:uas_smt3/controller/login_register_reset.dart';
import 'package:uas_smt3/screen/login.dart';
import 'package:uas_smt3/widget/garis.dart';
import 'package:uas_smt3/widget/kotak_text.dart';
import 'package:uas_smt3/widget/tombol.dart';
import 'package:uas_smt3/controller/firebase_crud/user_data.dart';

class Register extends StatefulWidget {
  static const String id = '/register';
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final LoginRegisterReset _reg = LoginRegisterReset();
  final UserDataFirestore userDataFirestore = UserDataFirestore();

  final String _role = 'pembeli';

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _teleponController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Buat Akun'),
                Text('Daftar sekarang dan buka akses eksklusif!'),
                KotakTextForm(
                  kataKunci: 'Nama',
                  tulisText: _namaController,
                ),
                KotakTextForm(
                  kataKunci: 'Alamat',
                  tulisText: _alamatController,
                ),
                KotakTextForm(
                  kataKunci: 'Telepon',
                  tulisText: _teleponController,
                ),
                KotakTextForm(
                  kataKunci: 'Email',
                  tulisText: _emailController,
                ),
                KotakTextForm(
                  kataKunci: 'Password',
                  tulisText: _passwordController,
                  textSamaran: true,
                ),
                TombolGarisPinggir(
                  tekan: () async {
                    setState(() {
                      CircularProgressIndicator();
                    });

                    try {
                      await _reg.register(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      var user = FirebaseAuth.instance.currentUser;
                      // Untuk Menambahkan Data Ke Firestore
                      await userDataFirestore.tambahUser(
                          _namaController.text,
                          _teleponController.text,
                          _emailController.text,
                          _alamatController.text,
                          _passwordController.text,
                          _role,
                          user!.uid);
                      // final UserCredential newUser =

                      if (mounted) {
                        setState(() {
                          Navigator.pushNamed(context, Login.id);
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  kataKata: 'Buat Akun',
                  warnaText: kPutih,
                  warnaTombol: kCoklat,
                ),
                TombolGarisPinggir(
                  tekan: () {
                    Navigator.pushNamed(context, Login.id);
                  },
                  kataKata: 'Login',
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
                          await _reg.loginGoogle();
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
                          await _reg.loginTwitter();
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
                          await _reg.loginFacebook();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
