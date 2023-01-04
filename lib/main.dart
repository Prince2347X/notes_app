import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_icons/simple_icons.dart';

import 'content.dart';
import 'models.dart';

String separator = "∞Ω"; //infinity and omega

void main() {
  runApp(const MaterialApp(
    home: NotesApp(), //ContentView(),
    debugShowCheckedModeBanner: false,
  ));
}

class NotesApp extends StatefulWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  int noOfNotes = 0;
  List<String> notesTitles = [];
  List<String> notesContents = [];
  void callback(List<String> note) {
    setState(() {
      noOfNotes += 1;
      notesTitles.insert(0, note[0]);
      notesContents.insert(0, note[1]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 247, 247, 247),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {launchUrl(Uri.parse("https://github.com/Prince2347X/notes_app"), mode: LaunchMode.externalApplication);}, icon: const Icon(SimpleIcons.github))
        ],
        title: const Text("Notes"),
      ),
      body: noOfNotes != 0
          ? ListView.builder(itemCount: noOfNotes,
      itemBuilder: (context, index) {
            return noteModal(notesTitles[index], notesContents[index], context);
      },)
          : const Center(
              child: Text(
                "You don't have any notes\nStart by creating one.",
                textAlign: TextAlign.center,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContentView(
                        isNew: true,
                    callback_: callback,
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
