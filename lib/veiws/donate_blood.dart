import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DonateBlood extends StatelessWidget {
  const DonateBlood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String phone = '+251983424242';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
             padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 242, 242),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/national_blood_bank.png',
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.blood_bank_name,
                  style:
                      const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.blood_bank_description,
                  style:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.social_media,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      launch('https://www.facebook.com/ENBBS/');
                    },
                    leading: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.facebook_title,
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      launch('tel:$phone');
                    },
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                    title: const Text(
                      phone,
                      style: TextStyle(
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
