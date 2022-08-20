import 'package:dam_dor/views/area/screens/select_area_screen.dart';
import 'package:dam_dor/views/market/screens/market_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;

  List<Widget> pages = [
    SelectArea(title: 'Select Area'),
    Center(
      child: Text('Bazar List Here!'),
    ),
    Center(
      child: Text('Accounts Here!'),
    ),
    Center(
      child: Text('Settings Here!'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 15,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        child: NavigationBar(
          elevation: 0,
          height: size.height * 0.1,
          selectedIndex: currentIndex,
          onDestinationSelected: (int value) {
            setState(() {
              currentIndex = value;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.list),
              label: 'Bazar List',
            ),
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.user),
              label: 'Accounts',
            ),
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.gear),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
