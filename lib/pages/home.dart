import 'package:chat_ui/models/message.dart';
import 'package:chat_ui/pages/chat.dart';
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
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Favorite contacts",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18.0,
                            )),
                        IconButton(
                            icon: Icon(Icons.more_horiz), onPressed: () {})
                      ],
                    ),
                  ),
                  Container(
                    height: 120.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: favorites.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (_) => ChatPage())),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 6.0),
                                  Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                favorites[index].imageUrl))),
                                  ),
                                  Text(
                                    favorites[index].name,
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
