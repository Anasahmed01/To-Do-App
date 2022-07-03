import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  List<String> chatNames = [];

  TextEditingController nameInput = TextEditingController();

  addChat() {
    setState(() {
      chatNames.add(nameInput.text);
      nameInput.clear();
    });

    print(chatNames);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1.9,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(left: 70.0, right: 70.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          fillColor: const Color(0xFF343645),
                          filled: true),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      controller: nameInput,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: SizedBox(
                        height: 60,
                        width: 100,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF343645),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            addChat();
                          },
                          child: const Text(
                            'Add',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: chatNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.grey,
                    title: Text(chatNames[index]),
                    onTap: () {
                      showAlertDialog(context);
                      setState(() {
                        chatNames.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Alert!"),
    content: const Text("Are you sure Delete this "),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget balanceSlideElevatedbutton() {
  return SizedBox(
    height: 60,
    width: 100,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF343645),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
      onPressed: () {},
      child: const Text(
        'Add',
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}
