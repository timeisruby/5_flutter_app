import 'package:flutter/material.dart';
import 'package:movement_app/screen/main_screen.dart';
import 'package:movement_app/screen/settings_screen.dart';
import 'dart:math';
import 'package:shake/shake.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;
  double threshold = 2.7;
  int number = 1;
  ShakeDetector? shakeDetector;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListenr);

    shakeDetector = ShakeDetector.autoStart(
      shakeSlopTimeMS: 100,
      shakeThresholdGravity: threshold,
      onPhoneShake: onPhoneShake,
    );
  }

  void onPhoneShake() {
    final rand = new Random();

    setState(() {
      number = rand.nextInt(4) + 1;
    });
  }

  tabListenr() {
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.removeListener(tabListenr);
    shakeDetector!.stopListening();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderChildren() {
    return [
      // Add your tab views here
      // Container(color: Colors.blue, child: Center(child: Text('Tab 1'))),
      MainScreen(number: number),
      //Container(color: Colors.orange, child: Center(child: Text('Tab 2'))),
      SettingScreen(threshold: threshold, onThresholdChange: onThresholdChange),
    ];
  }

  void onThresholdChange(double val) {
    setState(() {
      threshold = val;
    });
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Tab 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Tab 2',
        ),
      ],
      currentIndex: controller!.index,
      onTap: (int index) {
        setState(() {
          controller!.animateTo(index);
        });
      },
    );
  }
}
