import 'package:flutter/material.dart';
import 'package:map_exam/models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  const NoteCard(this.note, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          trailing: SizedBox(
            width: 110.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          title: Text(note.title.toString()),
          subtitle: Text(note.content.toString()),
          onTap: () {},
          onLongPress: () {},
        ),
        const Divider(color: Colors.blueGrey),
      ],
    );
  }
}
