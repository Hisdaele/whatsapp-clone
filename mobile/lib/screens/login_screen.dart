import 'package:flutter/material.dart';
import 'package:whatsapp/custom_ui/button_card.dart';
import 'package:whatsapp/screens/home_screen.dart';

import '../models/chat.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Chat sourceChat;
  List<Chat> chats = [
    Chat(
        name: 'M. Marouane',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: 'Avec plaisir ',
        id: 1),
    Chat(
        name: 'Ngangoué',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: "J'ai constaté",
        id: 2),
    Chat(
        name: 'Frère JC',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: 'Merci tonton',
        id: 3),
    Chat(
        name: 'Baholy',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: 'On a gagné',
        id: 4),
    Chat(
        name: 'Francis',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: "D'accord",
        id: 5),
    Chat(
        name: 'Messan Eric',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: 'Shalom Eric',
        id: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: chats.length,
        itemBuilder: (_, index) => InkWell(
            onTap: () {
              sourceChat = chats.removeAt(index);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => HomeScreen(
                            chats: chats,
                            sourceChat: sourceChat,
                          )));
            },
            child: ButtonCard(name: chats[index].name, icon: Icons.person)),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
