import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/user.dart';
import 'package:derash/widgets/add_dialogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrentMedication extends StatelessWidget {
  const CurrentMedication({Key? key}) : super(key: key);
  addCurrentMedication(name) async {
    final box = Boxes.getUser();
    if (box.values.isNotEmpty) {
      final user = box.values.first;
      user.currentMedications.add(name);
      await user.save();
    } else {
      final newUser = User()
        ..userName = ''
        ..age = ''
        ..sex = -1
        ..bloodGroup = ''
        ..currentMedications = [name]
        ..medicalConditions = []
        ..allergies = []
        ..emergencyContacts = []
        ..profileImageUrl = '';
      await box.add(newUser);
    }
  }

  deleteCurrentMedication(index) async {
    final box = Boxes.getUser();
    final user = box.values.first;
    user.currentMedications.removeAt(index);
    await user.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.medication_title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ValueListenableBuilder<Box<User>>(
          valueListenable: Boxes.getUser().listenable(),
          builder: (context, box, _) {
            final user = box.values.cast<User>();

            return user.isEmpty || user.first.currentMedications.isEmpty
                ? Padding(
                  padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 190),
                  child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 55),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 230, 230),
                        borderRadius: BorderRadius.all(Radius.circular(22.0)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            AppLocalizations.of(context)!.empty_medications_title,
                            style: const TextStyle(
                                fontSize: 35, color: Colors.black54),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            AppLocalizations.of(context)!.empty_medication_subtitle,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black54),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                       padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 245, 242, 242),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(AppLocalizations.of(context)!.medication_title,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            AppLocalizations.of(context)!.medication_subtitle,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: ListView.builder(
                                  itemCount: user.first.currentMedications.length,
                                  itemBuilder: (context, index) {
                                    final currentMedication =
                                        user.first.currentMedications[index];
                                    return Card(
                                      elevation: 3,
                                      child: ListTile(
                                          title: Text(currentMedication),
                                          trailing: IconButton(
                                            onPressed: () async {
                                              await deleteCurrentMedication(
                                                  index);
                                            },
                                            icon: const Icon(Icons.delete),
                                          )),
                                    );
                                  }))
                        ],
                      ),
                    ),
                  );
          }),
      floatingActionButton: Container(
        width: 60,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          highlightColor: Colors.red,
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return AddDialogueBox(
                      add: addCurrentMedication,
                      title: AppLocalizations.of(context)!.medication_title,
                      hintText1: AppLocalizations.of(context)!.name_hint,
                      hintText2: " ",
                      isContact: false);
                });
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
