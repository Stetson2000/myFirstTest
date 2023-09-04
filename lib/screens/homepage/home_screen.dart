import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_exam/screens/homepage/home_viewmodel.dart';
import 'package:map_exam/screens/homepage/widgets/notecard.dart';

class HomeScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const HomeScreen());
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageViewModel>(
        init: HomePageViewModel(
            (ModalRoute.of(context)!.settings.arguments as String)),
        builder: (viewmodel) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Notes'),
              actions: [
                CircleAvatar(
                  backgroundColor: Colors.blue.shade200,
                  child: Text(
                    viewmodel.notedLength.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: Column(
                children:
                    (viewmodel.notes?.map((e) => NoteCard(e)).toList()) ?? []),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                    heroTag: '1',
                    child: Icon(
                        (viewmodel.showNotes) ? Icons.unfold_less : Icons.menu),
                    tooltip: 'Show less. Hide notes content',
                    onPressed: () => viewmodel.toggleShowNotes()),

                /* Notes: for the "Show More" icon use: Icons.menu */

                FloatingActionButton(
                  heroTag: '2',
                  child: const Icon(Icons.add),
                  tooltip: 'Add a new note',
                  onPressed: () {},
                ),
              ],
            ),
          );
        });
  }
}
