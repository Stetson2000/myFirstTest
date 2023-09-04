import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_exam/models/note.dart';
import 'package:map_exam/screens/edit/edit_screen.dart';
import 'package:map_exam/screens/edit/edit_viewmodel.dart';
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
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => EditScreen(),
                              settings: RouteSettings(
                                  arguments: [note, NoteType.edit]))),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.blue,
                      ),
                      onPressed: () => viewmodel.deleteNote(note),
                    ),
                  ],
                ),
              ),
            ),
            title: Text(note.title.toString()),
            subtitle: Visibility(
                visible: viewmodel.showNotes,
                child: Text(note.content.toString())),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditScreen(),
                settings: RouteSettings(arguments: [note, NoteType.view]))),
            onLongPress: () => viewmodel.selectNote(note),
          ),
          const Divider(color: Colors.blueGrey),
        ],
      );
    });
  }
}
