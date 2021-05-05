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
    return ResponsiveBuilder(
      mobileChild: selectedContact != null ? buildChat(backArrow: true) : buildPreview(),
      tabletChild: Row(
        children: [
          Expanded(
            flex: 1,
            child: buildPreview(),
          ),
          Expanded(
            flex: 2,
            child: selectedContact != null ? buildChat(backArrow: false) : Scaffold(),
          ),
        ],
      ),
      desktopChild: Row(
        children: [
          Expanded(
            flex: 1,
            child: buildPreview(),
          ),
          Expanded(
            flex: 2,
            child: selectedContact != null ? buildChat(backArrow: false) : Scaffold(),
          ),
        ],
      ),
    );
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) => chatPreview(contacts[index]),
      ),
    );
  }

  Widget chatPreview(ContactModel contact) {
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1 / 1,
        child: CircleAvatar(
          backgroundColor: Colors.white12,
          backgroundImage: NetworkImage(contact.avatarUrl),
        ),
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

  Widget buildChat({@required bool backArrow}) {
    return Scaffold(
      appBar: appBarChat(backArrow),
      body: bodyChat(),
    );
  }

  Widget appBarChat(bool backArrow) {
    return AppBar(
      elevation: 0,
      leading: backArrow
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () => deselectContact(),
            )
          : null,
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white12,
            backgroundImage: NetworkImage(selectedContact.avatarUrl),
          ),
          SizedBox(
            width: 16,
          ),
          Text(selectedContact.user),
        ],
      ),
      actions: MediaQuery.of(context).size.width < 400
          ? [
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ]
          : [
              IconButton(
                icon: Icon(Icons.videocam),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.call),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
    );
  }

  Widget bodyChat() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: selectedContact.messages.length,
        itemBuilder: (context, index) => messageChat(index, selectedContact),
        separatorBuilder: (context, index) => SizedBox(height: 16),
      ),
    );
  }

  Widget messageChat(int index, ContactModel contact) {
    return Row(
      children: [
        Expanded(
          flex: 7,
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
        Expanded(
          flex: 1,
          child: SizedBox(
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobileChild;
  final Widget tabletChild;
  final Widget desktopChild;

  ResponsiveBuilder({
    @required this.mobileChild,
    @required this.tabletChild,
    @required this.desktopChild,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 400)
      return mobileChild;
    else if (width >= 400 && width < 1000)
      return tabletChild;
    else
      return desktopChild;
  }
}
