import 'package:flutter/material.dart';

class Garis extends StatelessWidget {
  const Garis({
    super.key,
    required this.jarakKiri,
    required this.jarakKanan,
  });

  final double jarakKiri;
  final double jarakKanan;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: Colors.black,
        thickness: 1,
        indent: jarakKiri,
        endIndent: jarakKanan,
      ),
    );
  }
}
