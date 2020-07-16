import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  static const platform = const MethodChannel('com.eggcial/message');

  List _messages = List(5);

  _ChatPageState() {
    platform.setMethodCallHandler((call) {
      if (call.method == "remove") {
        setState(() {
          _messages = List(_messages.length - 1);
        });
        return Future.delayed(Duration(seconds: 0), () => true);
      }
      return Future.delayed(Duration(seconds: 0), () => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Surname"),
        backgroundColor: const Color(0xff6200EE),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index % 3 == 0) {
                      return  Container(
                        padding: EdgeInsets.only(top: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 100),
                            ),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "Message from someone.",
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade400,
                                    borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundImage:
                              AssetImage("assets/images/default-user.png"),
                              radius: 16,
                            ),
                          ],
                        ),
                      );
                    }
                    return Container(
                      padding: EdgeInsets.only(top: 16, left: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/default-user.png"),
                            radius: 16,
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(left: 8),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Message from someone.",
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 100),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Send a message'),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _messages = List(_messages.length + 1);
                      });
                      platform.invokeMapMethod("send");
                    },
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text("Send"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
