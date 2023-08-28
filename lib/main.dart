import 'package:flutter/material.dart';
import 'package:unicode_app/contacts.dart';
import 'package:unicode_app/save_details.dart';
import 'package:intl/intl.dart';
import 'package:unicode_app/weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController contactNoTEC = TextEditingController();

  String dob = "";

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  void getDetails() async {
    nameTEC.text = await SaveDetails.readSaveDetails("Name");
    emailTEC.text = await SaveDetails.readSaveDetails("Email");
    contactNoTEC.text = await SaveDetails.readSaveDetails("Contact No");
    dob = await SaveDetails.readSaveDetails("DOB");
  }

  void setDetails() {
    SaveDetails.writeSaveDetails("Name", nameTEC.text);
    SaveDetails.writeSaveDetails("Email", emailTEC.text);
    SaveDetails.writeSaveDetails("Contact No", contactNoTEC.text);
    SaveDetails.writeSaveDetails("DOB", dob);
  }

  _pickFromDate() async {
    DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime(2004, 1, 8),
            firstDate: DateTime(2000),
            lastDate: DateTime(2010))
        .then((value) {
      setState(() {
        dob = value.toString();
      });
      return null;
    });

    var todaysDate =
        DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    if (date != null && todaysDate.isAfter(date)) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Screen"),
          backgroundColor: const Color.fromARGB(236, 255, 187, 0),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ContactsPage()));
                },
                icon: const Icon(Icons.contacts)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WeatherPage()));
                },
                icon: const Icon(Icons.cloud))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(236, 255, 187, 0),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          controller: nameTEC,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              labelText: "Name",
                              hintText: "Name",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailTEC,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              labelText: "Email",
                              hintText: "Enter Email",
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: contactNoTEC,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              labelText: "Contact No.",
                              hintText: "Enter Contact No.",
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 9, left: 10, right: 300),
                          child: IconButton(
                              icon: const Icon(
                                Icons.calendar_month,
                              ),
                              iconSize: 40,
                              tooltip: "Select DOB",
                              color: const Color.fromARGB(236, 255, 187, 0),
                              onPressed: _pickFromDate),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 3, bottom: 7, right: 150),
                            child: Text("DOB : $dob")),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 7, right: 120, left: 120),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: setDetails,
                              color: const Color.fromARGB(236, 255, 187, 0),
                              textColor: Colors.white,
                              child: const Text("Save Details"),
                            )),
                      ],
                    ))
                  ],
                ),
              ),
            )));
    //);
  }
}
