import 'dart:math';

import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactDetails extends StatelessWidget {
  final Contact contactsData;
  const ContactDetails(this.contactsData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Details"),
        backgroundColor: const Color.fromARGB(236, 255, 187, 0),
      ),
      body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 100),
          child: Center(
              child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
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
                      fontSize: 70,
                      color: Colors.primaries[
                          Random().nextInt(Colors.primaries.length)]),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Text(
                contactsData.givenName!,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(contactsData.phones![0].value!),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/call.png",
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Image.asset(
                    "assets/images/message.png",
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Image.asset(
                    "assets/images/videocall.png",
                    height: 50,
                    width: 50,
                  ),
                ],
              )
            ],
          ))),
    );
  }
}
