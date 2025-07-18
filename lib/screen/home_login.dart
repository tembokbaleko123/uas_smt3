import 'package:flutter/material.dart';
import 'package:uas_smt3/assets/gambar.dart';
import 'package:uas_smt3/constants.dart';
import 'package:uas_smt3/screen/login.dart';
import 'package:uas_smt3/screen/register.dart';

class HomeLogin extends StatefulWidget {
  static const String id = '/home_login';
  const HomeLogin({super.key});

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50), // Spacer pertama
              Container(
                width: MediaQuery.of(context).size.width *
                    0.8, // 80% dari lebar layar
                height: MediaQuery.of(context).size.height *
                    0.5, // 50% dari tinggi layar
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  homeLogin,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                'Selamat Datang!',
                style: TextStyle(
                  color: kHitam,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                child: Text(
                  'Silahkan Login terlebih dahulu, Belum punya akun? silahkan daftar pada menu dibawah ini',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kAbu, fontSize: 16),
                ),
              ),
              const SizedBox(height: 40), // Spacer tambahan untuk ruang
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Register.id);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kCoklat, // Warna coklat
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Login.id);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kAbu,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: kHitam,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50), // Spacer terakhir
            ],
          ),
        ),
      ),
    );
  }
}
