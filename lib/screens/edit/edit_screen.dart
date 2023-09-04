import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_exam/models/note.dart';
import 'package:map_exam/screens/edit/edit_viewmodel.dart';

// enum  Type {view , edit}
class EditScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const EditScreen());

  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditViewModel>(
        init:
            EditViewModel((ModalRoute.of(context)!.settings.arguments as List)),
        builder: (viewmodel) {
          return Scaffold(
            appBar: AppBar(
              leading: Container(),
              centerTitle: true,
              title: Text(viewmodel.appBarTitle),
              actions: [
                Visibility(
                  visible: viewmodel.showAddButton,
                  child: IconButton(
                      icon: const Icon(
                        Icons.check_circle,
                        size: 30,
                      ),
                      onPressed: () => viewmodel.addOrUpdate(context)),
                ),
                IconButton(
                    icon: const Icon(
                      Icons.cancel_sharp,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop()),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  TextFormField(
                    readOnly: viewmodel.readOnly,
                    controller: viewmodel.titleController,
                    initialValue: null,
                    enabled: true,
                    decoration: const InputDecoration(
                      hintText: 'Type the title here',
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                        readOnly: viewmodel.readOnly,
                        controller: viewmodel.descriptionController,
                        enabled: true,
                        initialValue: null,
                        maxLines: null,
                        expands: true,
                        decoration: const InputDecoration(
                          hintText: 'Type the description',
                        ),
                        onChanged: (value) {}),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
