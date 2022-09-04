import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wash_in_time/app/modules/login/controllers/login_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final LoginController _loginController = Get.put(LoginController());
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                color: Colors.black,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  await _loginController.storeDataToGetStorage(false);
                },
                icon: Icon(Icons.logout))
          ],
          title: Text(
            'Wash In Time',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
              child: ListView(
            children: [
              GetBuilder<HomeController>(builder: (_) {
                return homeController.greetings();
              }),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<dynamic>(
                future: homeController.getdataFromApi(),
                initialData: homeController.data,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return homeController.data == null
                      ? Center(child: Text('Loading..'))
                      : Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Medicine'),
                                  Text('Dose'),
                                  Text('Strength')
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(homeController
                                      .data!
                                      .problems!
                                      .first
                                      .diabetes!
                                      .first
                                      .medications!
                                      .first
                                      .medicationsClasses!
                                      .first
                                      .className!
                                      .first
                                      .associatedDrug!
                                      .first
                                      .name!),
                                  Text(homeController
                                      .data!
                                      .problems!
                                      .first
                                      .diabetes!
                                      .first
                                      .medications!
                                      .first
                                      .medicationsClasses!
                                      .first
                                      .className!
                                      .first
                                      .associatedDrug!
                                      .first
                                      .dose!),
                                  Text(homeController
                                      .data!
                                      .problems!
                                      .first
                                      .diabetes!
                                      .first
                                      .medications!
                                      .first
                                      .medicationsClasses!
                                      .first
                                      .className!
                                      .first
                                      .associatedDrug!
                                      .first
                                      .strength!)
                                ],
                              ),
                            ],
                          ),
                        );
                },
              ),
            ],
          )),
        ));
  }
}
