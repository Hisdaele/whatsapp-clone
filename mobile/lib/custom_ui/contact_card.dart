import 'package:flutter/material.dart';
import 'package:whatsapp/models/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;

  const ContactCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 30,
            child: const Icon(
              Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),
          Visibility(
            visible: contact.isSelected,
             child: Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 11,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      title: Text(
        contact.name.isNotEmpty ? contact.name : contact.phoneNumber,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
