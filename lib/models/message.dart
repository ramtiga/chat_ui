import 'package:chat_ui/models/user.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({this.sender, this.time, this.text, this.isLiked, this.unread});
}

final User currentUser =
    User(id: 0, name: 'Current User', imageUrl: 'assets/images/user0.jpg');

final User user1 =
    User(id: 1, name: 'User1', imageUrl: 'assets/images/user1.jpg');
final User user2 =
    User(id: 2, name: 'User2', imageUrl: 'assets/images/user2.jpg');
final User user3 =
    User(id: 3, name: 'User3', imageUrl: 'assets/images/user3.jpg');
final User user4 =
    User(id: 4, name: 'User4', imageUrl: 'assets/images/user4.jpg');
final User user5 =
    User(id: 5, name: 'User5', imageUrl: 'assets/images/user5.jpg');
final User user6 =
    User(id: 6, name: 'User6', imageUrl: 'assets/images/user6.jpg');
final User user7 =
    User(id: 7, name: 'User7', imageUrl: 'assets/images/user7.jpg');

List<User> favorites = [user2, user5, user1, user7];

List<Message> chats = [
  Message(
      sender: user1,
      time: '5:30 PM',
      text: 'こんにちは user1　さん。',
      isLiked: false,
      unread: true),
  Message(
      sender: user3,
      time: '4:30 PM',
      text: 'こんにちは user3 さん。',
      isLiked: false,
      unread: true),
];
