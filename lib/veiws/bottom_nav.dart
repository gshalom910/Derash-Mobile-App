import 'package:derash/veiws/emergency_page.dart';
import 'package:derash/veiws/home.dart';
import 'package:derash/veiws/hospitals.dart';
import 'package:derash/veiws/account/profile.dart';
import 'package:derash/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [const Home(), const EmergencyPage(), const Hospitals(), const Profile()];
    final titles = [
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.emergency,
      AppLocalizations.of(context)!.hospitals,
      AppLocalizations.of(context)!.account
    ];
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(titles[currentIndex]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(31),topRight: Radius.circular(31)),
          child: BottomNavigationBar(
            elevation: 3,
            iconSize: 40,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            backgroundColor: Color.fromARGB(255, 245, 242, 242),
            // selectedLabelStyle:
            //     const TextStyle(fontSize: 18, color: Colors.redAccent),
            // selectedIconTheme: Color( Colors.redAccent),
            unselectedLabelStyle: const TextStyle(fontSize: 16),
            selectedItemColor: Colors.red,
            unselectedItemColor: Color.fromARGB(221, 15, 15, 15),
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                label: titles[0],
                icon: const Icon(Icons.local_hospital_outlined),
                // const ImageIcon(
                //   AssetImage('assets/images/red_cross.png'),
                //   color: Colors.black,
                //   size: 36,
                ),
              BottomNavigationBarItem(
                label: titles[1],
                icon: const ImageIcon(
                  AssetImage('assets/images/emergency_icon.png'),
                  size: 36,
                ),
              ),
              BottomNavigationBarItem(
                label: titles[2],
                icon: const ImageIcon(
                  AssetImage('assets/images/hospitals_icon.png'),
                  size: 36,
                ),
              ),
              BottomNavigationBarItem(
                label: titles[3],
                icon: const Icon(Icons.person)
                ),
              
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabs,
      ),
    );
  }
}
