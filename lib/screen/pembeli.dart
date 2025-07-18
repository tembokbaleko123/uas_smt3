import 'package:flutter/material.dart';
import 'package:uas_smt3/screen/chat_screen/chat_screen.dart';

class HalamanPembeli extends StatefulWidget {
  const HalamanPembeli({super.key});
  static const id = '/halPembeli';

  @override
  State<HalamanPembeli> createState() => _HalamanPembeliState();
}

class _HalamanPembeliState extends State<HalamanPembeli> {
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
        child: Text('Halo Pembeli'),
      ),
    );
  }
}
