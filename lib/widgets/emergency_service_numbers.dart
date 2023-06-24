import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmergencyServiceNumbers extends StatelessWidget {
  const EmergencyServiceNumbers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
         padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 245, 242, 242),
          borderRadius: BorderRadius.all(Radius.circular(20.0),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Card(
              elevation: 2,
              child: ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return SimpleDialog(
                          titlePadding: const EdgeInsets.only(
                              top: 20, left: 15, right: 15, bottom: 0),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          title: Text(
                            AppLocalizations.of(context)!.meccare_title,
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          children: [
                            Text(
                              AppLocalizations.of(context)!.meccare_subtitle,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  launch('tel:7605');
                                },
                                leading: const Icon(Icons.dashboard_outlined),
                                title: Text(
                                  AppLocalizations.of(context)!.meccare_harar,
                                  style: const TextStyle(
                                    fontSize: 23,
                                  ),
                                ),
                                subtitle: Text(
                                  AppLocalizations.of(context)!.to_dial,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                trailing: const Icon(
                                  Icons.phone,
                                  color: Colors.green,
                                  size: 40,
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  launch('tel:7844');
                                },
                                leading: const Icon(Icons.dashboard_outlined),
                                title: Text(
                                  AppLocalizations.of(context)!.meccare_bahirdar,
                                  style: const TextStyle(
                                    fontSize: 23,
                                  ),
                                ),
                                subtitle: Text(
                                  AppLocalizations.of(context)!.to_dial,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                trailing: const Icon(
                                  Icons.phone,
                                  color: Colors.green,
                                  size: 40,
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  launch('tel:7337');
                                },
                                leading: const Icon(Icons.dashboard_outlined),
                                title: Text(
                                  AppLocalizations.of(context)!.meccare_hawassa,
                                  style: const TextStyle(
                                    fontSize: 23,
                                  ),
                                ),
                                subtitle: Text(
                                  AppLocalizations.of(context)!.to_dial,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                trailing: const Icon(
                                  Icons.phone,
                                  color: Colors.green,
                                  size: 40,
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                onTap: () {
                                  launch('tel:6238');
                                },
                                leading: const Icon(Icons.dashboard_outlined),
                                title: Text(
                                  AppLocalizations.of(context)!.meccare_jimma,
                                  style: const TextStyle(
                                    fontSize: 23,
                                  ),
                                ),
                                subtitle: Text(
                                  AppLocalizations.of(context)!.to_dial,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                trailing: const Icon(
                                  Icons.phone,
                                  color: Colors.green,
                                  size: 40,
                                ),
                              ),
                            )
                          ],
                        );
                      });
                },
                leading: Image.asset(
                  'assets/images/meicip.png',
                  width: 55,
                ),
                title: Text(
                  AppLocalizations.of(context)!.meccare,
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.to_dial,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                trailing: const Icon(
                  Icons.phone,
                  color: Colors.green,
                  size: 40,
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                onTap: () {
                  launch('tel:907');
                },
                leading: Image.asset(
                  'assets/images/red_cross.png',
                  width: 40,
                ),
                title: Text(
                  AppLocalizations.of(context)!.ems,
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.to_dial,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                trailing: const Icon(
                  Icons.phone,
                  color: Colors.green,
                  size: 40,
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                onTap: () {
                  launch('tel:939');
                },
                leading: Image.asset(
                  'assets/images/fire.png',
                  width: 45,
                ),
                title: Text(
                  AppLocalizations.of(context)!.tebita_fire_dep,
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.to_dial,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                trailing: const Icon(
                  Icons.phone,
                  color: Colors.green,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
