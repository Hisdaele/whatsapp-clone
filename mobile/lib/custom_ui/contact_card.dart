import 'package:flutter/material.dart';
import 'package:whatsapp/models/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;

  const ContactCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        radius: 30,
        child: const Icon(
          Icons.person,
          size: 30,
          color: Colors.white,
        ),
      ),
      title: Text(
        contact.name.isNotEmpty ? contact.name : contact.phoneNumber,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contact.actus,
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
