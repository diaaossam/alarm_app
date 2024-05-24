import 'package:equatable/equatable.dart';

class AllDaysEntity extends Equatable {
  final int id;
  final String title;

  const AllDaysEntity({required this.id, required this.title});

  @override
  List<Object> get props => [id, title];
}

List<AllDaysEntity> convertFromModelToEntityAllDays(List<AllDaysEntity> list) {
  List<AllDaysEntity> workingList = [];
  for (var element in list) {
    AllDaysEntity allDaysEntity = AllDaysEntity(id: element.id, title: element.title);
    workingList.add(allDaysEntity);
  }
  return workingList;
}
