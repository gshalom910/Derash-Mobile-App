import 'dart:io';
import 'package:derash/helper_functions/boxes.dart';
import 'package:derash/models/user.dart';
import 'package:derash/providers/locale_provider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeData = Provider.of<LocalProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: Colors.red,
      child: Column(
        children: [
          ValueListenableBuilder<Box<User>>(
              valueListenable: Boxes.getUser().listenable(),
              builder: (context, box, _) {
                final user = box.values.cast<User>();
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: user.isNotEmpty &&
                                  user.first.profileImageUrl != ''
                              ? FileImage(File(user.first.profileImageUrl))
                              : null,
                          radius: 30,
                          child:
                              user.isEmpty || user.first.profileImageUrl == ''
                                  ? Image.asset(
                                      'assets/images/med_kit.png',
                                      width: 30,
                                    )
                                  : Container(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: user.isEmpty
                              ? Text(
                                  AppLocalizations.of(context)!.name_hint,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )
                              : Text(
                                  user.first.userName,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ]),
                );
              }),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, top: 10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return SimpleDialog(
                              titlePadding: const EdgeInsets.only(
                                  top: 20, left: 15, right: 15, bottom: 0),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              title: Text(
                                AppLocalizations.of(context)!.select_a_language,
                                style: const TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        elevation: MaterialStateProperty.all(5),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                horizontal: 45, vertical: 15))),
                                    onPressed: () {
                                      localeData.setLocale(const Locale('am'));
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'አማርኛ',
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        elevation: MaterialStateProperty.all(5),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                horizontal: 45, vertical: 15))),
                                    onPressed: () {
                                      localeData.setLocale(const Locale('en'));
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'English',
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        elevation: MaterialStateProperty.all(5),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                horizontal: 45, vertical: 15))),
                                    onPressed: () {
                                      localeData.setLocale(const Locale('om'));
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Oromiffaa',
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Text(AppLocalizations.of(context)!.languages,
                        style: const TextStyle(
                          fontSize: 18,
                        ))),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('about-us');
                    },
                    child: Text(AppLocalizations.of(context)!.about_us,
                        style: const TextStyle(
                          fontSize: 18,
                        ))),
                TextButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.app_version,
                        style: const TextStyle(
                          fontSize: 18,
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
