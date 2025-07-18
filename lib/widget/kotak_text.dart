import 'package:flutter/material.dart';
import 'package:uas_smt3/constants.dart';

class KotakTextForm extends StatelessWidget {
  const KotakTextForm({
    super.key,
    required this.kataKunci,
    this.textSamaran,
    required this.tulisText,
  });

  final bool? textSamaran;
  final String kataKunci;
  final TextEditingController tulisText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextFormField(
          controller: tulisText,
          obscureText: textSamaran ?? false,
          decoration: kTextFieldDecoration.copyWith(label: Text(kataKunci)),
        ));
  }
}
