import 'package:flutter/material.dart';

class ContactModel {
  final String user;
  final String avatarUrl;
  final List<String> messages;

  ContactModel({
    @required this.user,
    @required this.avatarUrl,
    @required this.messages,
  });
}
