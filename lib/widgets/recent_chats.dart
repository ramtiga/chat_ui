import 'package:chat_ui/models/message.dart';
import 'package:chat_ui/pages/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                final Message chat = chats[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatPage(
                                user: chat.sender,
                              ))),
                  child: Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(chat.sender.imageUrl))),
                        ),
                        SizedBox(width: 1.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chat.sender.name,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(
                                chat.text,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          children: [
                            Text(
                              chat.time,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            chat.unread
                                ? Container(
                                    width: 40.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("NEW",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  )
                                : Text(""),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
