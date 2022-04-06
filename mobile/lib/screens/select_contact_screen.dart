import 'package:flutter/material.dart';
import 'package:whatsapp/custom_ui/button_card.dart';
import 'package:whatsapp/custom_ui/contact_card.dart';
import 'package:whatsapp/models/contact.dart';
import 'package:whatsapp/screens/create_group_screen.dart';

class SelectContactScreen extends StatefulWidget {
  const SelectContactScreen({Key? key}) : super(key: key);

  @override
  State<SelectContactScreen> createState() => _SelectContactScreenState();
}

class _SelectContactScreenState extends State<SelectContactScreen> {
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
    Contact(
        phoneNumber: 'Abdo Ensa',
        name: '',
        icon: '',
        actus: ""),
    Contact(
        phoneNumber: 'Abdo Bleu',
        name: '',
        icon: '',
        actus: "Occupé"),
    Contact(
        phoneNumber: 'Abo Thiam',
        name: '',
        icon: '',
        actus: "Salut J'utilise WhatsApp"),
    Contact(
        phoneNumber: 'Alain Jude',
        name: '',
        icon: '',
        actus: "Busy"),
  ];
  final items = <Widget>[];

  @override
  void initState() {
    super.initState();
    items.add(_createAddGroupButton());
    items.add(_createAddPersonButton());
    for (var element in contacts) {
      items.add(ContactCard(contact: element));
    }
  }

  Widget _createAddPersonButton() =>
      const ButtonCard(name: 'New contact', icon: Icons.person_add);

  Widget _createAddGroupButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateGroupScreen()));
      },
      child: const ButtonCard(name: 'New group', icon: Icons.group_add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Contacts',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '358 contacts',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text("Invite a friend"),
                value: "Invite a friend",
              ),
              const PopupMenuItem(
                child: Text("Contacts"),
                value: "Contacts",
              ),
              const PopupMenuItem(
                child: Text("Refresh"),
                value: "Refresh",
              ),
              const PopupMenuItem(
                child: Text("Help"),
                value: "Help",
              ),
            ];
          })
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (__, index) => Padding(
                padding: const EdgeInsets.only(top: 5),
                child: items[index],
              )),
    );
  }
}
