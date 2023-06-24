import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DonateDialogue extends StatelessWidget {
  final int amount;
  const DonateDialogue({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding:
          const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      title: Text(
        AppLocalizations.of(context)!.chfe_title_one,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      children: [
        Text(
          AppLocalizations.of(context)!.chfe_are_you_sure(amount),
          style: const TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                String message;
                switch (amount) {
                  case 1:
                    message = 'A';
                    break;
                  case 10:
                    message = 'B';
                    break;
                  case 50:
                    message = 'C';
                    break;
                  case 100:
                    message = 'D';
                    break;
                  default:
                    message = 'A';
                    break;
                }
                launch('sms:6710?body=$message');
              },
              child: Text(
                AppLocalizations.of(context)!.yes,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.red),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                AppLocalizations.of(context)!.no,
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ],
        )
      ],
    );
  }
}
