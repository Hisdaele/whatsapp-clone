import 'package:flutter/material.dart';
import 'package:whatsapp/screens/individual_screen.dart';

import '../models/chat.dart';

class CustomCard extends StatelessWidget {
  final Chat chat;

  const CustomCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => IndividualScreen(
                    chat: chat,
                  )),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          radius: 30,
          child: Icon(
            chat.isGroup ? Icons.groups : Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: Text(
          chat.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.done_all),
            const SizedBox(
              width: 3,
            ),
            Expanded(
              child: Text(
                chat.currentMessage,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        trailing: Text(chat.time),
      ),
    );
  }
}
