// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../consts/AppAssets.dart';

import 'package:dam_dor/models/json_model.dart';
import 'package:dam_dor/views/market/screens/market_details.dart';

class ParentScreen extends StatefulWidget {
  final String title;
  const ParentScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );



  static List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      Container(),
      Container(),
      Container(),
      Container(),
      Container(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return true;
        }
        _selectedIndex = 0;
        setState(() {});
        return false;
      },
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Text('Hello Sami Vai'),
                centerTitle: true,
              ),
              body: IndexedStack(
                children: _widgetOptions,
                index: _selectedIndex,
              ),
              bottomNavigationBar: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.transparent,
                    ),
                    child: BottomNavigationBar(
                      backgroundColor: Colors.white,
                      selectedItemColor: Colors.red,
                      unselectedItemColor: Colors.black.withOpacity(0.5),
                      showSelectedLabels: true,
                      selectedLabelStyle: const TextStyle(fontSize: 12),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      type: BottomNavigationBarType.fixed,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 0 ? Colors.red : Colors.black45,
                              BlendMode.modulate,
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              child: const Icon(Icons.home),
                            ),
                          ),
                          label: 'HOME',
                        ),
                        BottomNavigationBarItem(
                          icon: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 1 ? Colors.red : Colors.black45,
                              BlendMode.modulate,
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              child: const Icon(Icons.home),
                            ),
                          ),
                          label: 'LIVE',
                        ),
                        BottomNavigationBarItem(
                          icon: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 1 ? Colors.red : Colors.black45,
                              BlendMode.modulate,
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              child: const Icon(Icons.home),
                            ),
                          ),
                          label: 'LEAGUES',
                        ),
                        BottomNavigationBarItem(
                          icon: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 2 ? Colors.red : Colors.black45,
                              BlendMode.modulate,
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              child: const Icon(Icons.home),
                            ),
                          ),
                          label: 'NEWS',
                        ),
                        BottomNavigationBarItem(
                          icon: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 3 ? Colors.red : Colors.black45,
                              BlendMode.modulate,
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              child: const Icon(Icons.home),
                            ),
                          ),
                          label: 'MORE',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      onTap: _onItemTapped,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
