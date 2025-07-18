import 'package:flutter/material.dart';

// ElevatedButton Tombol Widget
class TombolElevated extends StatelessWidget {
  const TombolElevated({
    super.key,
    required this.kataKata,
    this.warnaText,
    this.warnaTombol,
    required this.tekan,
    this.lebar,
    this.tinggi,
  });

  final String kataKata;
  final Color? warnaText;
  final Color? warnaTombol;
  final double? lebar;
  final double? tinggi;
  final VoidCallback tekan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: lebar ?? 400,
      height: tinggi ?? 50,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(
                warnaTombol ?? Color(0xffFFFFFF))),
        onPressed: tekan,
        child: Text(
          kataKata,
          style: TextStyle(color: warnaText ?? Colors.black),
        ),
      ),
    );
  }
}

// OutlainedButton Tombol Widget
class TombolGarisPinggir extends StatelessWidget {
  const TombolGarisPinggir(
      {super.key,
      required this.kataKata,
      this.warnaTombol,
      this.warnaText,
      required this.tekan});

  final String kataKata;
  final Color? warnaTombol;
  final Color? warnaText;
  final VoidCallback tekan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black),
          backgroundColor:
              warnaTombol ?? Color(0xffffffff), // Mengatur warna latar belakang
        ),
        onPressed: tekan,
        child: Center(
          child: Text(
            kataKata,
            textAlign: TextAlign.center,
            style: TextStyle(color: warnaText ?? Colors.black), // Warna teks
          ),
        ),
      ),
    );
  }
}
