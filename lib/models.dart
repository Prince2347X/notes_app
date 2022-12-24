import 'package:flutter/material.dart';

import 'content.dart';

Widget noteModal(String? title, String? content, BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(12)),
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContentView(
                  title: title, content: content, )));
      },
      onLongPress: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.89,
            child: Text(
              title ?? "",
              softWrap: false,
              overflow: TextOverflow.fade,
              style:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              content ?? "",
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    ),
  );
}

// class Note extends StatefulWidget {
//   final String? title, content;
//
//   const Note({Key? key, required this.title, required this.content})
//       : super(key: key);
//
//   @override
//   State<Note> createState() => _NoteState();
// }
//
// class _NoteState extends State<Note> {
//   String? title, content;
//
//   @override
//   void initState() {
//     print("hmm${widget.title}");
//     title = widget.title;
//     content = widget.content;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(12)),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => ContentView(
//                     title: title, content: content, )));
//         },
//         onLongPress: () {},
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.89,
//               child: Text(
//                 title ?? "",
//                 softWrap: false,
//                 overflow: TextOverflow.fade,
//                 style:
//                 const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Text(
//                 content ?? "",
//                 overflow: TextOverflow.ellipsis,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


