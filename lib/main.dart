import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'content.dart';

void main() {
  runApp(const MaterialApp(
    home: NotesApp(),//ContentView(),
    debugShowCheckedModeBanner: false,
  ));
}

class NotesApp extends StatefulWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  int _noOfNotes = 0;


  @override
  void initState() {
    _loadNoOfNotes();
    super.initState();
  }

  Future<void> _loadNoOfNotes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _noOfNotes = prefs.getInt('no_of_notes') ?? 0;
      prefs.setInt('np_of_notes', _noOfNotes);
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 247, 247, 247),
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: _noOfNotes != 0 ? NotesView() : const Center(
        child: Text("You don't have any notes\nStart by creating one.", textAlign: TextAlign.center,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ContentView()));
        }, //TODO: IMPLEMENT NOTES CREATING
        child: const Icon(Icons.add),
      ),
    );
  }
}



class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return const Text("Hmm...");
  }
}


