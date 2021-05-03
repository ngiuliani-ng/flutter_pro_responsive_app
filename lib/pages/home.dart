import 'package:flutter/material.dart';

import 'package:flutter_pro_responsive_app/models/contact.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ContactModel> contacts = [
    ContactModel(
      user: 'Nicolò Giuliani',
      avatarUrl: 'https://bit.ly/3vv25Y2',
      messages: [
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      ],
    ),
    ContactModel(
      user: 'Nicolò Giuliani',
      avatarUrl: 'https://bit.ly/3vv25Y2',
      messages: [
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
      ],
    ),
    ContactModel(
      user: 'Nicolò Giuliani',
      avatarUrl: 'https://bit.ly/3vv25Y2',
      messages: [
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
      ],
    ),
    ContactModel(
      user: 'Nicolò Giuliani',
      avatarUrl: 'https://bit.ly/3vv25Y2',
      messages: [
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      ],
    ),
    ContactModel(
      user: 'Nicolò Giuliani',
      avatarUrl: 'https://bit.ly/3vv25Y2',
      messages: [
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        'Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC.',
      ],
    ),
  ];

  ContactModel selectedContact;

  void selectContact(ContactModel contact) {
    setState(() {
      selectedContact = contact;
    });
  }

  void deselectContact() {
    setState(() {
      selectedContact = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Responsive Design.
    return selectedContact != null ? buildChat() : buildPreview();
  }

  Widget buildPreview() {
    return Scaffold(
      appBar: appBarPreview(),
      body: bodyPreview(),
    );
  }

  Widget appBarPreview() {
    return AppBar(
      elevation: 0,
      title: Text('Messages'),
      centerTitle: true,
    );
  }

  Widget bodyPreview() {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) => chatPreview(contacts[index]),
    );
  }

  Widget chatPreview(ContactModel contact) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white12,
        backgroundImage: NetworkImage(contact.avatarUrl),
      ),
      title: Text(
        contact.user,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.messages[contact.messages.length - 1].toString(), // Last.
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => selectContact(contact),
    );
  }

  Widget buildChat() {
    return Scaffold(
      appBar: appBarChat(),
      body: bodyChat(),
    );
  }

  Widget appBarChat() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () => deselectContact(),
      ),
      title: Text(selectedContact.user),
    );
  }

  Widget bodyChat() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: ListView.separated(
        itemCount: selectedContact.messages.length,
        itemBuilder: (context, index) => messageChat(index, selectedContact),
        separatorBuilder: (context, index) => SizedBox(height: 12),
      ),
    );
  }

  Widget messageChat(int index, ContactModel contact) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white12,
          backgroundImage: NetworkImage(contact.avatarUrl),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(contact.messages[index]),
            ),
          ),
        ),
      ],
    );
  }
}
