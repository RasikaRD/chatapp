import 'package:chatapp/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt',
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
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text('No messages found!...')),
          );
        }
        if (chatSnapshots.hasError) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text('Something went wrong!...')),
          );
        }
        final loadedMessages = chatSnapshots.data!.docs;
        return Padding(
          padding: const EdgeInsets.only(left: 25, top: 20),
          child: ListView.builder(
              reverse: true,
              itemCount: loadedMessages.length,
              itemBuilder: (ctx, index) {
                final chatMessage = loadedMessages[index].data();
                final nextChatMessage = index + 1 < loadedMessages.length
                    ? loadedMessages[index + 1].data()
                    : null;
                final currentMessageUserId = chatMessage['userId'];
                final nextMessageUserId =
                    nextChatMessage != null ? nextChatMessage['userId'] : null;
                final nextUsrIsSame = nextMessageUserId == currentMessageUserId;

                if (nextUsrIsSame) {
                  return MessageBubble.next(
                    message: chatMessage['text'],
                    isMe: authUser.uid == currentMessageUserId,
                  );
                } else {
                  return MessageBubble.first(
                      userImage: chatMessage['userImage'],
                      username: chatMessage['userName'],
                      message: chatMessage['text'],
                      isMe: authUser.uid == currentMessageUserId);
                }
              }),
        );
      },
    );
  }
}
