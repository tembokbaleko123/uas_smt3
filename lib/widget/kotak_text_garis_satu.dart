import 'package:flutter/material.dart';
import 'package:uas_smt3/constants.dart';

class KotakTextGarisSatu extends StatelessWidget {
  const KotakTextGarisSatu({
    super.key,
    required this.controller,
    required this.kataKata,
    this.iconBelakang,
    this.tipeKeyboard,
    this.obscure,
  });

  final bool? obscure;
  final TextEditingController controller;
  final Widget? iconBelakang;
  final String kataKata;
  final TextInputType? tipeKeyboard;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure ?? false,
      keyboardType: tipeKeyboard ?? TextInputType.emailAddress,
      controller: controller,
      decoration: kTextFieldDecoration.copyWith(
        suffixIcon: iconBelakang,
        hintText: kataKata,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
