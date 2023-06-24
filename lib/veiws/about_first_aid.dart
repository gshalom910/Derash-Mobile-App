// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutFirstAid extends StatelessWidget {
  const AboutFirstAid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
          child: Container(
             padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 242, 242),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:118.0,bottom: 6),
                  child: Image.asset('assets/images/firstaid.jpg',height: 115),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Text(
                    AppLocalizations.of(context)!.about_first_aid,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.definition,
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    AppLocalizations.of(context)!.about_first_aid_description,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  AppLocalizations.of(context)!.becoming_first_aider,
                  style:
                      const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  AppLocalizations.of(context)!.prepare_yourself,
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    AppLocalizations.of(context)!.prepare__yourself_description,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  AppLocalizations.of(context)!.key_steps_title,
                  style:
                      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:25.0),
                  child: Text(
                    AppLocalizations.of(context)!.key_steps_description,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  AppLocalizations.of(context)!.first_aid_legal,
                  style:
                      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,bottom: 10),
                  child: Text(
                    AppLocalizations.of(context)!.first_aid_legal_description,
                    style: const TextStyle(fontSize: 18),
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
