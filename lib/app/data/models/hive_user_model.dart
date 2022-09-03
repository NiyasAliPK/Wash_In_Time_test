import 'package:hive_flutter/adapters.dart';
part 'hive_user_model.g.dart';

@HiveType(typeId: 0)
class HiveUserModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String gender;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String city;
  @HiveField(5)
  final String phone;
  @HiveField(6)
  final String cell;
  @HiveField(7)
  final String regDate;
  @HiveField(8)
  final String nation;

  HiveUserModel(
      {required this.name,
      required this.gender,
      required this.age,
      required this.email,
      required this.city,
      required this.phone,
      required this.cell,
      required this.regDate,
      required this.nation});
}
