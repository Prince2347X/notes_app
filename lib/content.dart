import 'package:flutter/material.dart';


class ContentView extends StatefulWidget {
  final bool isNew;
  final String? title, content;
  final Function? callback_;

  const ContentView({Key? key, this.isNew = false, this.title, this.content, this.callback_})
      : super(key: key);

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  bool isNew = false;
  String? title, content;
  @override
  void initState() {
    isNew = widget.isNew;
    content = widget.content;
    title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: isNew ? null : title);
    TextEditingController contentController =
        TextEditingController(text: isNew ? null : content);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            isNew ? "NEW NOTE" : "NOTE",
            style: const TextStyle(
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
                if (isNew) {
                  widget.callback_!(
                    [titleController.text, contentController.text]
                  );
                }
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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: TextField(
              controller: titleController,
              cursorWidth: 3,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
              textInputAction: TextInputAction.done,
              enabled: true,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          TextField(
            controller: contentController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Start typing...",
                contentPadding: EdgeInsets.symmetric(horizontal: 12)),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            autofocus: isNew ? true : false,
            cursorHeight: 18,
          )
        ],
      )),
    );
  }
}
