import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = '/chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _scrollController = ScrollController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  User? loggedInUser;
  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser!.email);
        getMessages();
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final messages = await _firestore.collection('messages').get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  void getMessagesStream() async {
    await for (var messages in _firestore.collection('messages').snapshots()) {
      for (var message in messages.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  // .where('sender', isEqualTo: loggedInUser!.email)
                  .orderBy('creDt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong!!");
                }
                print('Am I Wrong?');
                if (snapshot.hasData) {
                  final messages = snapshot.data!.docs;
                  List<Widget> messageWidgets = [];
                  for (var message in messages) {
                    // Map<String, dynamic> data =
                    //     snapshot.data!.docs as Map<String, dynamic>;
                    final String messageText = message['text'];
                    final String messageSender = message['sender'];
                    final messageBubble = MessageBubble(
                      sender: messageSender,
                      text: messageText,
                      isLoggedUser: messageSender == loggedInUser!.email,
                    );
                    messageWidgets.add(messageBubble);
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      controller: _scrollController,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      children: messageWidgets,
                    ),
                  );
                } else {
                  return Text("Loading");
                }
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (messageText != '') {
                        messageTextController.clear();
                        final currentTime = new DateTime.now();
                        await _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser!.email,
                          'creDt': currentTime
                        });

                        messageText = '';
                        _scrollController.animateTo(
                          _scrollController.position.minScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 500),
                        );
                      }
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {required this.sender, required this.text, required this.isLoggedUser});
  final String sender;
  final String text;
  final bool isLoggedUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isLoggedUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12),
          ),
          Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              color: isLoggedUser ? Colors.lightBlueAccent : Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  text,
                  style: TextStyle(
                      color: isLoggedUser ? Colors.white : Colors.black54,
                      fontSize: 15),
                ),
              )),
        ],
      ),
    );
  }
}
