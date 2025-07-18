import 'package:flutter/material.dart';
import 'package:uas_smt3/constants.dart';
import 'package:uas_smt3/controller/login_register_reset.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = '/forgotPass';
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final LoginRegisterReset _resetPass = LoginRegisterReset();

  Future<void> _sendPasswordResetEmail() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Logika untuk mengirim email reset password
      await _resetPass.resetPass(email: _emailController.text);

      if (mounted) {
        // Menampilkan snackbar untuk notifikasi sukses
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Reset email sent to ${_emailController.text}'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        // Menampilkan snackbar untuk notifikasi gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send reset email: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Tombol back
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  // Judul Halaman
                  const Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Deskripsi Halaman
                  Text(
                    "Enter the email associated with your account and we'll send an email with instructions to reset your password.",
                    style: TextStyle(
                      fontSize: 14,
                      color: kAbu,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Input Email
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: kTextFieldDecoration.copyWith(
                      prefixIcon:
                          const Icon(Icons.email_outlined, color: Colors.grey),
                      hintText: "Enter your email here",
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                          .hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  // Tombol Reset Password
                  Center(
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _sendPasswordResetEmail,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Reset Password",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
