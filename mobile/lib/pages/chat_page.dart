import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat.dart';
import 'package:whatsapp/screens/select_contact_screen.dart';

import '../custom_ui/custom_card.dart';

class ChatPage extends StatefulWidget {
  final List<Chat> chats;
  final Chat sourceChat;

  const ChatPage({Key? key, required this.chats, required this.sourceChat})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  /*List<Chat> chats = [
    Chat(
        name: 'Serviteurs Royaux VPV 1',
        icon: 'person.svg',
        isGroup: true,
        time: '8:12',
        currentMessage: 'Bonjour les serviteurs du Royaume'),
    Chat(
        name: 'GROUPE DES SAGES TPVS',
        icon: 'person.svg',
        isGroup: true,
        time: '8:12',
        currentMessage: 'Je ne parviens pas à me connecter'),
    Chat(
        name: 'M. Marouane',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: 'Avec plaisir '),
    Chat(
        name: 'Maison Amour',
        icon: 'person.svg',
        isGroup: true,
        time: '8:12',
        currentMessage: 'Nous sommes une famille'),
    Chat(
        name: 'Ngangoué',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: "J'ai constaté"),
    Chat(
        name: 'Frère JC',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: 'Merci tonton'),
    Chat(
        name: 'Baholy',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: 'On a gagné'),
    Chat(
        name: '365 days',
        icon: 'person.svg',
        isGroup: true,
        time: '8:12',
        currentMessage: 'François: Bien noté Hisdaele'),
    Chat(
        name: 'Francis',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: "D'accord"),
    Chat(
        name: 'SR Eclaireurs',
        icon: 'person.svg',
        isGroup: true,
        time: '8:12',
        currentMessage: 'Bénédicta: Amen'),
    Chat(
        name: 'Messan Eric',
        icon: 'person.svg',
        isGroup: false,
        time: '8:12',
        currentMessage: 'Shalom Eric'),
    Chat(
        name: 'TPV SR Avenir',
        icon: 'person.svg',
        isGroup: true,
        time: '8:12',
        currentMessage: 'Daniel: Amen'),
  ];
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const SelectContactScreen()));
        },
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: widget.chats.length,
        itemBuilder: (context, index) => CustomCard(
          chat: widget.chats[index],
          sourceChat: widget.sourceChat,
        ),
      ),
    );
  }
}
