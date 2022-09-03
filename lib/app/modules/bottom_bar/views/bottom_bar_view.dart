import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wash_in_time/app/modules/drinks/views/drinks_view.dart';
import 'package:wash_in_time/app/modules/home/views/home_view.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  final BottomBarController _bottomBarController =
      Get.put(BottomBarController());
  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _bottomBarController.pageController,
          children: [
            HomeView(),
            DrinksView(),
          ],
          onPageChanged: (index) {
            _bottomBarController.currentIndex.value = index;
          },
        ),
        bottomNavigationBar: Obx(
          () {
            return BottomBar(
              selectedIndex: _bottomBarController.currentIndex.value,
              onTap: (int index) {
                _bottomBarController.pageController.jumpToPage(index);
                _bottomBarController.currentIndex.value = index;
              },
              items: <BottomBarItem>[
                BottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  activeColor: Colors.blue,
                ),
                BottomBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text('Tabs'),
                  activeColor: Colors.red,
                ),
              ],
            );
          },
        ));
  }
}
