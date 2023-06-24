import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/user.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  String selectedBloodGroup = 'A+';

  var bloodGroup = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  final box = Boxes.getUser();

  saveUserData() async {
    if (formKey.currentState!.validate()) {
      if (box.values.isNotEmpty) {
        final user = box.values.first;
        user.userName = nameController.text;
        user.age = ageController.text;
        user.sex = _selectedGender;
        user.bloodGroup = selectedBloodGroup;
        await user.save();
      } else {
        final newUser = User()
          ..userName = nameController.text
          ..age = ageController.text
          ..sex = _selectedGender
          ..bloodGroup = selectedBloodGroup
          ..currentMedications = []
          ..medicalConditions = []
          ..allergies = []
          ..emergencyContacts = []
          ..profileImageUrl = '';
        await box.add(newUser);
      }
      Navigator.of(context).pop();
    }
  }

  String selectedGender = '';
  int _selectedGender = 0;
  @override
  void initState() {
    if (box.values.isNotEmpty) {
      final user = box.values.first;
      nameController.text = user.userName;
      ageController.text = user.age;
      selectedBloodGroup = user.bloodGroup;
      _selectedGender = user.sex;
    }

    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gender = [
      AppLocalizations.of(context)!.sex_female,
      AppLocalizations.of(context)!.sex_male,
    ];

    if (_selectedGender > 0) {
      selectedGender = gender[_selectedGender];
    }
    if (selectedGender == '') {
      selectedGender = gender[0];
    }
    if (selectedBloodGroup == '') {
      selectedBloodGroup = bloodGroup[0];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 242, 242),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.profile_title,
                  style:
                      const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.profile_subtitle,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          // initialValue:
                          //     box.isNotEmpty ? box.values.first.userName : '',
                          textAlign: TextAlign.start,
                          validator: (val) {
                            return val!.isEmpty
                                ? AppLocalizations.of(context)!.name_error_text
                                : null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 20,
                            ),
                            label: Text(
                              AppLocalizations.of(context)!.name_hint,
                            ),
                            labelStyle: const TextStyle(color: Colors.red),
                            focusColor: Colors.red,
                          ),
                        ),
                        TextFormField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          // initialValue:
                          //     box.isNotEmpty ? box.values.first.age : '',
                          textAlign: TextAlign.start,
                          validator: (val) {
                            return val!.isEmpty
                                ? AppLocalizations.of(context)!.age_error_text
                                : null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 20,
                            ),
                            label: Text(AppLocalizations.of(context)!.age_hint),
                            labelStyle: const TextStyle(color: Colors.red),
                            focusColor: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(13),
                          child: DropdownButton(
                            isExpanded: true,
                            iconDisabledColor: Colors.red,
                            iconEnabledColor: Colors.red,
                            style: const TextStyle(color: Colors.red),
                            value: selectedGender,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: gender.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGender = newValue!;
                                _selectedGender = gender.indexOf(newValue);
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(13),
                          child: DropdownButton(
                            isExpanded: true,
                            iconDisabledColor: Colors.red,
                            iconEnabledColor: Colors.red,
                            style: const TextStyle(color: Colors.red),
                            value: selectedBloodGroup,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: bloodGroup.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedBloodGroup = newValue!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await saveUserData();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 17),
                            child: Text(AppLocalizations.of(context)!.save),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
