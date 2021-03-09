import 'package:chat_ui/models/user.dart';
import 'package:flutter/material.dart';

class Message {
  User sender;
  String time;
  String text;
  bool isLiked;
  bool unread;

  Message({this.sender, this.time, this.text, this.isLiked, this.unread});
}

final User currentUser =
    User(id: 0, name: 'Current User', imageUrl: 'assets/images/user0.png');

final User user1 = User(id: 1, name: 'まさ', imageUrl: 'assets/images/user1.png');
final User user2 =
    User(id: 2, name: 'ゆうか', imageUrl: 'assets/images/user2.png');
final User user3 =
    User(id: 3, name: 'たろう', imageUrl: 'assets/images/user3.png');
final User user4 =
    User(id: 4, name: 'いちろう', imageUrl: 'assets/images/user4.png');
final User user5 = User(id: 5, name: 'ひろ', imageUrl: 'assets/images/user5.png');
final User user6 = User(id: 6, name: 'さく', imageUrl: 'assets/images/user6.png');
final User user7 = User(id: 7, name: 'まい', imageUrl: 'assets/images/user7.png');

List<User> favorites = [user2, user5, user1, user4, user6, user7];

List<Message> chats = [
  Message(
      sender: user1,
      time: '5:30 PM',
      text: 'こんにちはまささん。いまなにしてますか？',
      isLiked: false,
      unread: true),
  Message(
      sender: user3,
      time: '4:30 PM',
      text: 'こんにちはたろうさん。',
      isLiked: false,
      unread: true),
  Message(
      sender: user7,
      time: '3:12 PM',
      text: 'ハローまいさん。',
      isLiked: false,
      unread: false),
  Message(
      sender: user6,
      time: '1:48 PM',
      text: 'Heloo, What are you doing today?',
      isLiked: false,
      unread: true),
  Message(
      sender: user5,
      time: '0:35 PM',
      text: 'Heloo, What are you doing today?',
      isLiked: false,
      unread: false),
  Message(
      sender: user4,
      time: '0:01 PM',
      text: 'ハローいちろうさん。',
      isLiked: false,
      unread: true),
  Message(
      sender: user2,
      time: '11:08 AM',
      text: 'Heloo, What are you doing today?',
      isLiked: false,
      unread: false),
];

List<Message> messages = [
  Message(
    sender: user1,
    time: '5:39 PM',
    text: 'OK！またよるにー',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:28 PM',
    text: '駅に20時くらいどう？',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: user1,
    time: '3:45 PM',
    text: '何時くらいにしようか',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: user1,
    time: '3:15 PM',
    text: 'じゃあ夜にごはんいこうか',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: '今日は仕事だけど夜はあいてるよ',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: user1,
    time: '2:00 PM',
    text: '今日は何してる？',
    isLiked: false,
    unread: true,
  ),
];

class MessageChangeNotifier with ChangeNotifier {
  List<Message> msgs = messages;

  void changeLike(Message msg) {
    msg.isLiked ? msg.isLiked = false : msg.isLiked = true;
    notifyListeners();
  }
}
