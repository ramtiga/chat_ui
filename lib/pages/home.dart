import 'package:chat_ui/widgets/favorite_contacts.dart';
import 'package:chat_ui/widgets/recent_chats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectMenuProvider = StateProvider((ref) => 0);

class HomePage extends HookWidget {
  final List<String> catetories = ['Mesaages', 'Online', 'Groups', 'Requests'];

  @override
  Widget build(BuildContext context) {
    final int selectIndex = useProvider(selectMenuProvider).state;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text("Chat App"),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Column(
        children: [
          Container(
            height: 90.0,
            color: Colors.indigo,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: catetories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read(selectMenuProvider).state = index;
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 30.0,
                    ),
                    child: Text(
                      catetories[index],
                      style: TextStyle(
                        color: index == selectIndex
                            ? Colors.white
                            : Colors.white60,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(
                children: [
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
