import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddDialogueBox extends StatelessWidget {
  final Function add;
  final String title;
  final String hintText1;
  final String hintText2;
  final bool isContact;
  AddDialogueBox({
    Key? key,
    required this.title,
    required this.hintText1,
    required this.hintText2,
    required this.isContact,
    required this.add,
  }) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SimpleDialog(
        titlePadding: const EdgeInsets.all(30),
        contentPadding: const EdgeInsets.all(30),
        title: Text(
          title,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        children: [
          TextFormField(
              controller: nameController,
              textAlign: TextAlign.center,
              validator: (val) {
                return val!.isEmpty
                    ? AppLocalizations.of(context)!.name_error_text
                    : null;
              },
              decoration:
                  InputDecoration(hintText: hintText1, focusColor: Colors.red)),
          const SizedBox(
            height: 20,
          ),
          if (isContact)
            TextFormField(
                controller: phoneController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                validator: (val) {
                  return val!.isEmpty
                      ? AppLocalizations.of(context)!.name_error_text
                      : null;
                },
                decoration: InputDecoration(
                    hintText: hintText2, focusColor: Colors.red)),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (isContact) {
                    await add(nameController.text, phoneController.text);
                  } else {
                    await add(nameController.text);
                  }
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                AppLocalizations.of(context)!.add_item,
              ))
        ],
      ),
    );
  }
}
