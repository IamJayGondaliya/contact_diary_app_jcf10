import 'dart:io';

class Contact {
  String name;
  String contact;
  String email;
  File? image;

  Contact({required this.name, required this.contact, required this.email, this.image});
}
