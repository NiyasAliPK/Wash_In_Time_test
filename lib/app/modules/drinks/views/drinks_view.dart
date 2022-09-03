import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wash_in_time/app/data/api/service.dart';
import 'package:wash_in_time/app/modules/drinks/views/widgets/cloud_db_view.dart';
import 'package:wash_in_time/app/modules/drinks/views/widgets/local_db_view.dart';

import '../controllers/drinks_controller.dart';

class DrinksView extends GetView<DrinksController> {
  final DrinksController _controller = Get.put(DrinksController());
  final Services _services = Get.put(Services());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _controller.pageIndex,
      length: 2,
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await _services.getAllDrinksAndUser();
            },
            child: Icon(Icons.refresh_rounded),
          ),
          appBar: PreferredSize(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                bottom: TabBar(
                  isScrollable: false,
                  indicatorColor: Colors.black,
                  onTap: (value) async {
                    _controller.changeIndex(value);
                  },
                  tabs: [
                    Tab(
                      text: 'Local Storage',
                    ),
                    Tab(text: 'Cloud Storage')
                  ],
                  labelColor: Colors.black,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              preferredSize: Size(100, 50)),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
                child: TabBarView(children: [LocalDbView(), CloudDbView()])),
          )),
    );
  }
}
