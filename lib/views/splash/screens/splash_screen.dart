import 'package:dam_dor/parent_screen.dart';
import 'package:dam_dor/views/area/screens/select_area_screen.dart';
import 'package:dam_dor/views/market/screens/market_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'dart:async';

import '../../../consts/AppAssets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    Timer(
      4.seconds,
      () => Get.off(
        () => const SelectArea(
          title: 'Market Location',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                AppAssets.logo,
                width: 260,
                height: 260,
              ),
            ),
          ),
          const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
