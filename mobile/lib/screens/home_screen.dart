import 'package:flutter/material.dart';
import 'package:whatsapp/pages/camera_page.dart';
import 'package:whatsapp/pages/chat_page.dart';

import '../models/chat.dart';

class HomeScreen extends StatefulWidget {
  final List<Chat> chats;
  final Chat sourceChat;
  const HomeScreen({Key? key, required this.chats, required this.sourceChat}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final _controller =
      TabController(length: 4, vsync: this, initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("WhatsApp"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value){
              print(value);
            },
              itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text("New group"),
                value: "New group",
              ),
              const PopupMenuItem(
                child: Text("New broadcast"),
                value: "New broadcast",
              ),
              const PopupMenuItem(
                child: Text("Whatsapp web"),
                value: "Whatsapp web",
              ),
              const PopupMenuItem(
                child: Text("Starred messages"),
                value: "Starred messages",
              ),
              const PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              )
            ];
          })
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children:  [
          const CameraPage(),
          ChatPage(chats: widget.chats,sourceChat: widget.sourceChat,),
          const Text("Status"),
          const Text("Calls")
        ],
      ),
    );
  }
}
