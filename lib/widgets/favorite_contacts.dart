import 'package:chat_ui/models/message.dart';
import 'package:chat_ui/pages/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        fontWeight: FontWeight.bold,
                      )),
                  IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
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
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ChatPage(
                                    user: favorites[index],
                                  ))),
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
    );
  }
}
