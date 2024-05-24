import 'package:alarm_app/core/api/dio_consumer.dart';
import 'package:alarm_app/core/api/end_points.dart';
import 'package:alarm_app/features/timer/data/models/all_days_model.dart';
import 'package:alarm_app/features/timer/data/models/working_days_model/working_day.dart';
import 'package:alarm_app/features/timer/data/models/working_days_model/working_days_model.dart';

abstract class TimerRemoteDataSource {
  Future<List<AllDaysModel>> getAllDays();

  Future<String> completeRegister({required WorkingDaysModel workingDaysModel});
}

class TimerRemoteDataSourceImpl implements TimerRemoteDataSource {
  final DioConsumer dioConsumer;

  TimerRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<AllDaysModel>> getAllDays() async {
    final response = await dioConsumer.get(EndPoints.allDays);
    List<dynamic> list = response['data'];

    List<AllDaysModel> allDaysList = list
        .map<AllDaysModel>((element) => AllDaysModel.fromJson(element))
        .toList();
    return allDaysList;
  }

  @override
  Future<String> completeRegister(
      {required WorkingDaysModel workingDaysModel}) async {
    List<WorkingDay> list = [];
    workingDaysModel.workingDays?.forEach((element) {
      list.add(element);
    });
    list.removeAt(0);
    WorkingDaysModel model = WorkingDaysModel(workingDays: list);
    print(model.toJson());
     final response =
     await dioConsumer.post("${EndPoints.completeRegister}/01HYNA60QDGK62NM6K6PYW490P", body: model.toJson());
    return response['message'];
  }
}
