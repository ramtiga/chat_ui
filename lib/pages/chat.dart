import 'package:chat_ui/models/message.dart';
import 'package:chat_ui/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatProvider = ChangeNotifierProvider((ref) => MessageChangeNotifier());

class ChatPage extends HookWidget {
  final User user;
  ChatPage({this.user});
  @override
  Widget build(BuildContext context) {
    final messageChats = useProvider(chatProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  child: ListView.builder(
                      reverse: true,
                      itemCount: messageChats.msgs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final message = messageChats.msgs[index];
                        bool isMe =
                            message.sender == currentUser ? true : false;
                        final Container msg = Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          margin: isMe
                              ? EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                  left: 80.0,
                                )
                              : EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 15.0),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.amber[50] : Color(0xFFFFEFEE),
                            borderRadius: isMe
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    bottomLeft: Radius.circular(15.0),
                                  )
                                : BorderRadius.only(
                                    topRight: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                  ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.time,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                message.text,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                        if (isMe) {
                          return msg;
                        }
                        return Row(
                          children: [
                            msg,
                            IconButton(
                                icon: message.isLiked
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : Icon(Icons.favorite_border),
                                onPressed: () =>
                                    messageChats.changeLike(message)),
                          ],
                        );
                      }),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
              height: 70.0,
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.photo),
                      iconSize: 25.0,
                      color: Colors.indigo,
                      onPressed: () {}),
                  Expanded(
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {},
                      decoration: InputDecoration.collapsed(
                        hintText: 'Send a message...',
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.send),
                      iconSize: 25.0,
                      color: Colors.indigo,
                      onPressed: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
