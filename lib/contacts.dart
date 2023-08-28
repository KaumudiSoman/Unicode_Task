import 'dart:math';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unicode_app/contactDetails.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => Contacts();
}

class Contacts extends State<ContactsPage> {
  List<Contact> contacts = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getContsctsPermission();
  }

  void getContsctsPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  void fetchContacts() async {
    contacts = await ContactsService.getContacts();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contacts Screen"),
          backgroundColor: const Color.fromARGB(236, 255, 187, 0),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.of(context).push(
          //             MaterialPageRoute(builder: (context) => WeatherPage()));
          //       },
          //       icon: const Icon(Icons.cloud))
          // ],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  Contact contactsData = contacts[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContactDetails(contactsData)));
                    },
                    leading: Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 7,
                            color: Colors.white,
                            offset: Offset(-3, -3),
                          ),
                          BoxShadow(
                            blurRadius: 7,
                            color: Colors.black,
                            offset: Offset(3, 3),
                          )
                        ],
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black87,
                      ),
                      child: Text(
                        contactsData.givenName![0],
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]),
                      ),
                    ),
                    title: Text(
                      contactsData.givenName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    subtitle: Text(
                      contactsData.phones![0].value!,
                      style: const TextStyle(
                          fontSize: 11,
                          color: Color.fromARGB(255, 147, 144, 144)),
                    ),
                  );
                }));
  }
}
