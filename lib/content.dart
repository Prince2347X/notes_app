import 'package:flutter/material.dart';

class ContentView extends StatefulWidget {
  const ContentView({Key? key}) : super(key: key);

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "NEW NOTE",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        toolbarHeight: 32,
        leadingWidth: 40,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              splashRadius: 14,
              icon: const Icon(
                Icons.check,
                color: Colors.black,
                size: 22,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: IconButton(
            splashRadius: 14,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: TextField(
              cursorWidth: 3,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
              textInputAction: TextInputAction.done,
              enabled: true,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Start typing...",
                contentPadding: EdgeInsets.symmetric(horizontal: 12)),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            autofocus: true,
            cursorHeight: 18,
          )
        ],
      )),
    );
  }
}
