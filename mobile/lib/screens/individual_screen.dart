import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:whatsapp/custom_ui/own_message_card.dart';
import 'package:whatsapp/custom_ui/reply_card.dart';

import '../models/chat.dart';

class IndividualScreen extends StatefulWidget {
  final Chat chat;
  final Chat sourceChat;

  const IndividualScreen(
      {Key? key, required this.chat, required this.sourceChat})
      : super(key: key);

  @override
  State<IndividualScreen> createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  final messageController = TextEditingController();
  bool hasText = false;
  late final Socket _socket;

  @override
  void initState() {
    super.initState();
    _connect();
  }

  void _connect() {
    _socket = io('http://192.168.1.71:5000', {
      'transports': ['websocket'],
      'autoConnect': false,
    });
    _socket.connect();
    _socket.onConnect((data) {
      print('Connected');
    });
    print(_socket.connected);
    _socket.emit('/signin', widget.sourceChat.id);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    _socket.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        titleSpacing: 0.0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              const Icon(Icons.arrow_back),
              Expanded(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 25,
                  child: Icon(
                    widget.chat.isGroup ? Icons.groups : Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chat.name,
                  style: const TextStyle(
                      fontSize: 18.5, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'last seen today at 12:05',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text("New group"),
                value: "New group",
              ),
              const PopupMenuItem(
                child: Text("View Contact"),
                value: "View Contact",
              ),
              const PopupMenuItem(
                child: Text("Media, links and docs"),
                value: "Media, links and docs",
              ),
              const PopupMenuItem(
                child: Text("Search"),
                value: "Search",
              ),
              const PopupMenuItem(
                child: Text("Mute notifications"),
                value: "Mute notifications",
              ),
              const PopupMenuItem(
                child: Text("Wallpaper"),
                value: "Wallpaper",
              )
            ];
          })
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/images/whatsappWallpaper.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 145,
              child: ListView(
                children: [
                  OwnMessageCard(),
                  ReplyCard(),
                  OwnMessageCard(),
                  ReplyCard(),
                  OwnMessageCard(),
                  ReplyCard(),
                  OwnMessageCard(),
                  ReplyCard(),
                  OwnMessageCard(),
                  OwnMessageCard(),
                  ReplyCard(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      margin:
                          const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        controller: messageController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                            contentPadding: const EdgeInsets.all(5),
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.emoji_emotions),
                              onPressed: () {},
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.attach_file),
                                  onPressed: () {},
                                ),
                                Visibility(
                                    visible: !hasText,
                                    child: IconButton(
                                      icon: const Icon(Icons.camera_alt),
                                      onPressed: () {},
                                    ))
                              ],
                            )),
                        onChanged: (value) {
                          if(value.isNotEmpty != hasText){
                            setState(() {
                              hasText = value.isNotEmpty;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, left: 2.0, right: 4.0),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 25,
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(hasText ? Icons.send : Icons.mic),
                        onPressed: () {
                          if (hasText) {
                            sendMessage(
                              messageController.text,
                              widget.sourceChat.id,
                              widget.chat.id,
                            );
                            messageController.clear();
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
