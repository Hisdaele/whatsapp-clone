import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactAvatar extends StatelessWidget {
  final Contact contact;

  const ContactAvatar({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 23,
              child: const Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 11,
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        Text(
          contact.name.isNotEmpty ? contact.name : contact.phoneNumber,
        ),
      ],
    );
  }
}
