import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/message_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chat")
            .orderBy(
              "createdAt",
              descending: true,
            )
            .snapshots(),
        builder: (ctx, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            return const Center(
              child: Text("No messages found"),
            );
          }
          if (chatSnapshots.hasError) {
            return const Center(
              child: Text("Something went wrong!"),
            );
          }
          final loadedMessages = chatSnapshots.data!.docs;
          return ListView.builder(
              padding: const EdgeInsets.only(
                bottom: 40,
                left: 13,
                right: 13,
              ),
              reverse: true,
              itemCount: loadedMessages.length,
              itemBuilder: (ctx, index) {
                final chatmessage = loadedMessages[index].data();
                final nextChatMesage = index + 1 < loadedMessages.length
                    ? loadedMessages[index + 1].data()
                    : null;
                final currentMessageUserId = chatmessage['username'];
                final nextMessageUserId =
                    nextChatMesage != null ? nextChatMesage['username'] : null;
                final nextUserIsSame =
                    nextMessageUserId == currentMessageUserId;
                if (nextUserIsSame) {
                  return MessageBubble.next(
                    message: chatmessage['text'],
                    isMe: authenticatedUser.uid == currentMessageUserId,
                  );
                } else {
                  MessageBubble.first(
                    username: chatmessage["username"],
                    message: chatmessage['text'],
                    isMe: authenticatedUser.uid == currentMessageUserId,
                  );
                }
              });
        });
  }
}
