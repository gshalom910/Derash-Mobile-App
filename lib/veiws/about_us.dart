import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade100,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
             padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 242, 242),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/blue_health_logo.png',
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    AppLocalizations.of(context)!.medica_link_name,
                    style:
                        const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    AppLocalizations.of(context)!.medica_link_description,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    AppLocalizations.of(context)!.medica_link_vision_title,
                    style:
                        const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    AppLocalizations.of(context)!.medica_link_vision_subtitle,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    AppLocalizations.of(context)!.medica_link_mission_title,
                    style:
                        const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    AppLocalizations.of(context)!.medica_link_mission_subtitle,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    AppLocalizations.of(context)!.social_media,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () async {
                      await launch('https://www.facebook.com/bluehealthethiopia/');
                    },
                    leading: ImageIcon(
                      const AssetImage('assets/images/facebook.png'),
                      color: Colors.blue.shade700,
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
                    onTap: () async {
                      await launch(
                          'https://www.instagram.com/_u/bluehealthethiopia');
                    },
                    leading: ImageIcon(
                      const AssetImage('assets/images/instagram.png'),
                      color: Colors.pink.shade700,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.instagram_title,
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () async {
                      await launch(
                          'https://www.linkedin.com/company/blue-health-ethiopia');
                    },
                    leading: ImageIcon(
                      const AssetImage('assets/images/linkedin.png'),
                      color: Colors.blue.shade900,
                    ), 
                    title: Text(
                      AppLocalizations.of(context)!.linkedin_title,
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
                      launch('https://t.me/bluehealthethiopia');
                    },
                    leading: ImageIcon(
                      const AssetImage('assets/images/telegram.png'),
                      color: Colors.blue.shade700,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.telegram_title,
                      style: const TextStyle(
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
