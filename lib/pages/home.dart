import 'package:flutter/material.dart';

import 'package:flutter_pro_responsive_app/models/contact.dart';

import 'package:flutter_pro_responsive_app/pages/chat.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0,
      title: Text('Messages'),
      centerTitle: true,
    );
  }

  Widget body(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) => chat(context, contacts[index]),
    );
  }

  Widget chat(BuildContext context, ContactModel contact) {
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
      onTap: () {
        Navigator.pushNamed(
          context,
          ChatPage.routeName,
          arguments: contact,
        );
      },
    );
  }
}
