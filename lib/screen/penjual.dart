import 'package:flutter/material.dart';
import 'package:uas_smt3/screen/chat_screen/chat_screen.dart';

class HalamanPenjual extends StatefulWidget {
  const HalamanPenjual({super.key});
  static const String id = '/halPenjual';

  @override
  State<HalamanPenjual> createState() => _HalamanPenjualState();
}

class _HalamanPenjualState extends State<HalamanPenjual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, ChatScreen.id);
          },
          icon: Icon(Icons.message),
        ),
      ),
      body: Center(
        child: Text('Halo Penjual'),
      ),
    );
  }
}
