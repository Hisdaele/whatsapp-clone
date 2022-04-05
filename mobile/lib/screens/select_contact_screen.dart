import 'package:flutter/material.dart';
import 'package:whatsapp/custom_ui/button_card.dart';
import 'package:whatsapp/custom_ui/contact_card.dart';
import 'package:whatsapp/models/contact.dart';

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
  ];
  final items = <Widget>[];


  @override
  void initState() {
    super.initState();
    items.add(const ButtonCard(name: 'New group', icon: Icons.group_add));
    items.add(const ButtonCard(name: 'New contact', icon: Icons.person_add));
    for (var element in contacts) {
      items.add(ContactCard(contact: element));
    }
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
            padding: const EdgeInsets.all(8.0),
            child: items[index],
          )),
    );
  }
}
