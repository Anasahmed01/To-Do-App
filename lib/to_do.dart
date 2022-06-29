import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  List<String> chatNames = ["Ali", "Bilal"];

  TextEditingController nameInput = TextEditingController();

  addChat() {
    setState(() {
      chatNames.add(nameInput.text);
      nameInput.clear();
    });

    print(chatNames);
  }

  AlertDialog() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                controller: nameInput,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addChat();
              },
              child: const Text('Add'),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chatNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.grey,
                    title: Text(chatNames[index]),
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
