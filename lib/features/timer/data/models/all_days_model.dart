import 'package:alarm_app/features/timer/domain/entities/all_days_entity.dart';

class AllDaysModel extends AllDaysEntity {
  const AllDaysModel({required super.id, required super.title});

  factory AllDaysModel.fromJson(Map<String, dynamic> json) =>
      AllDaysModel(id: json['id'], title: json['title']);


}
