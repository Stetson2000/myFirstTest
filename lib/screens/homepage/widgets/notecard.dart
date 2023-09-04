import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_exam/models/note.dart';
import 'package:map_exam/screens/homepage/home_viewmodel.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  const NoteCard(this.note, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(builder: (viewmodel) {
      return Column(
        children: [
          ListTile(
            trailing: Visibility(
              visible: viewmodel.isSelected(note),
              child: SizedBox(
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
            ),
            title: Text(note.title.toString()),
            subtitle: Visibility(
                visible: viewmodel.showNotes,
                child: Text(note.content.toString())),
            onTap: () {},
            onLongPress: () => viewmodel.selectNote(note),
          ),
          const Divider(color: Colors.blueGrey),
        ],
      );
    });
  }
}
