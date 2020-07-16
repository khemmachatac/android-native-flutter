import 'package:eggcial_flutter/pages/ChatPage.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List _items = List(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message"),
        backgroundColor: const Color(0xff6200EE),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return  GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
              },
              child: Container(
                padding: EdgeInsets.only(top: 4, left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                          AssetImage("assets/images/default-user.png"),
                          radius: 24,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Name Surname",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4),
                              ),
                              Text(
                                "Hello, Welcome to flutter message app, I think you are awesome!",
                                maxLines: 2,
                                style: TextStyle(color: Colors.grey.shade600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                    ),
                    Divider(color: Colors.grey,),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
