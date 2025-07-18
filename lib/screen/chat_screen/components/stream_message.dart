import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uas_smt3/screen/chat_screen/chat_screen.dart';
import 'package:uas_smt3/screen/chat_screen/components/message_bubble.dart';

class MessageStream extends StatelessWidget {
  MessageStream({super.key});

  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('messages')
          .orderBy('time', descending: false)
          .snapshots(), //tambahkan orderBy untuk mengurutkan
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data!.docs
              .reversed; //tambahkan reversed untuk melawan balik reverse dari listview (yang berada dibawah ini)
          List<MessageBuble> messageBubbles =
              []; //ubah dari List<Text> ke List <MessageBubble>
          for (var message in messages) {
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final currentUser = loggedInUser!.email;

            final messageBubble = MessageBuble(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
            );
            // final messageWidget = Text(
            //   '$messageText from $messageSender',
            //   style: TextStyle(fontSize: 50),
            // );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageBubbles,
            ),
          );
        } else {
          return const CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          );
        }
      },
    );
  }
}
