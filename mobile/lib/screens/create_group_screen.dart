import 'package:flutter/material.dart';
import 'package:whatsapp/custom_ui/contact_avatar.dart';

import '../custom_ui/contact_card.dart';
import '../models/contact.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final contacts = [
    Contact(
        phoneNumber: '+223 76 29 98 75',
        name: '',
        icon: '',
        actus: "Salut J'utilise WhatsApp"),
    Contact(
        phoneNumber: '+226 62 44 60 85',
        name: '',
        icon: '',
        actus: "Prenez soin de vous"),
    Contact(
        phoneNumber: 'AbdelKarim',
        name: '',
        icon: '',
        actus: "Abdel.optimiste"),
    Contact(phoneNumber: 'Abdo Ensa', name: '', icon: '', actus: ""),
    Contact(phoneNumber: 'Abdo Bleu', name: '', icon: '', actus: "Occupé"),
    Contact(
        phoneNumber: 'Abo Thiam',
        name: '',
        icon: '',
        actus: "Salut J'utilise WhatsApp"),
    Contact(phoneNumber: 'Alain Jude', name: '', icon: '', actus: "Busy"),
  ];
  final groupMembers = <Contact>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Group',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              groupMembers.isEmpty
                  ? 'Add a participant'
                  : '${groupMembers.length} selected',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          Visibility(
            visible: groupMembers.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final contact = groupMembers[index];
                      return InkWell(
                        child: ContactAvatar(contact: contact),
                        onTap: () {
                          groupMembers.remove(contact);
                          contact.isSelected = false;
                          setState(() {});
                        },
                      );
                    },
                    separatorBuilder: (_, index) => const SizedBox(
                      width: 5,
                    ),
                    itemCount: groupMembers.length,
                  )),
            ),
          ),
          if (groupMembers.isNotEmpty) const Divider(),
          Expanded(
            child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (__, index) => Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: InkWell(
                          onTap: () {
                            Contact item = contacts[index];
                            if (item.isSelected) {
                              item.isSelected = false;
                              groupMembers.remove(item);
                            } else {
                              item.isSelected = true;
                              groupMembers.add(item);
                            }
                            setState(() {});
                          },
                          child: ContactCard(
                            contact: contacts[index],
                          )),
                    )),
          ),
        ],
      ),
    );
  }
}
