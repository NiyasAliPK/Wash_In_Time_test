import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wash_in_time/app/data/api/service.dart';

class CloudDbView extends StatelessWidget {
  CloudDbView({super.key});
  final Services _services = Get.put(Services());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
                color: Color.fromARGB(255, 216, 216, 216),
                child: GetBuilder<Services>(builder: (_) {
                  return _services.userModel.isEmpty
                      ? Text('Loading..')
                      : ListView.separated(
                          itemCount: _services.userModel.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            final data = _services.userModel[index];
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        NetworkImage("${data.picture!.large}"),
                                  ),
                                  Text("Name :${data.name!.first}"),
                                  Text("Gender :${data.gender}"),
                                  Text("Age :${data.dob!.age}"),
                                  Text("Email :${data.email}"),
                                  Text("City :${data.location!.city}"),
                                  Text("Phone :${data.phone}"),
                                  Text("Cell :${data.cell}"),
                                  Text("Reg.Date :${data.registered!.date}"),
                                  Text("Nation :${data.nat}"),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Drink Name',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Category',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                })),
          ),
          Expanded(
            child: Container(child: GetBuilder<Services>(builder: (_) {
              return _services.drinksModel == null
                  ? Text('Loading...')
                  : ListView.separated(
                      itemCount: _services.drinksModel!.drinks.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final data = _services.drinksModel!.drinks[index];
                        return ListTile(
                          title: Text('${data.strDrink}'),
                          // leading: Text('${data.strCategory}'),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage("${data.strDrinkThumb}"),
                          ),
                          trailing: Text('${data.strCategory}'),
                        );
                      },
                    );
            })),
          ),
        ],
      )),
    );
  }
}
