import 'package:flutter/material.dart';

import 'package:flutter_pro_responsive_app/models/contact.dart';

class ChatPage extends StatelessWidget {
  static String routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    final ContactModel contact = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar(contact),
      body: body(contact),
    );
  }

  Widget appBar(ContactModel contact) {
    return AppBar(
      elevation: 0,
      title: Text(contact.user),
    );
  }

  Widget body(ContactModel contact) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: ListView.separated(
        itemCount: contact.messages.length,
        itemBuilder: (context, index) => message(index, contact),
        separatorBuilder: (context, index) => SizedBox(height: 12),
      ),
    );
  }

  Widget message(int index, ContactModel contact) {
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
