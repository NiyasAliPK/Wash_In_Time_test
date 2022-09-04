import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wash_in_time/app/data/db/user_model_hive_functions.dart';

import '../../../../data/db/drink_model_hive_functions.dart';

class LocalDbView extends StatelessWidget {
  LocalDbView({super.key});

  final DrinkHiveModelController _drinkHiveModelController =
      Get.put(DrinkHiveModelController());
  final UserHiveController _userHiveController = Get.put(UserHiveController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          GetBuilder<UserHiveController>(builder: (_) {
            return _userHiveController.user.isEmpty
                ? Text('Nothing fetched from the API yet...')
                : Expanded(
                    child: Container(
                    //  margin: EdgeInsets.only(top: 20),
                    color: Color.fromARGB(255, 216, 216, 216),
                    child: Column(children: [
                      Text("Name :${_userHiveController.user.first.name}"),
                      Text("Gender :${_userHiveController.user.first.gender}"),
                      Text("Age :${_userHiveController.user.first.age}"),
                      Text("Email :${_userHiveController.user.first.email}"),
                      Text("City :${_userHiveController.user.first.city}"),
                      Text("Phone :${_userHiveController.user.first.phone}"),
                      Text("Cell :${_userHiveController.user.first.cell}"),
                      Text(
                          "Reg.Date :${_userHiveController.user.first.regDate}"),
                      Text("Nation :${_userHiveController.user.first.nation}"),
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Drink Name',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Text('Category',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ]),
                  ));
          }),
          GetBuilder<DrinkHiveModelController>(builder: (_) {
            return _drinkHiveModelController.drinks.isEmpty
                ? Text('Nothing fetched from the API yet...')
                : Expanded(
                    child: Container(
                      child: ListView.separated(
                        itemCount: _drinkHiveModelController.drinks.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(_drinkHiveModelController
                                .drinks[index].drinkName),
                            trailing: Text(_drinkHiveModelController
                                .drinks[index].drinkCat),
                          );
                        },
                      ),
                    ),
                  );
          })
        ],
      )),
    );
  }
}
