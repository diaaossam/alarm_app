import 'package:equatable/equatable.dart';

import 'working_day.dart';

class WorkingDaysModel extends Equatable {
	final List<WorkingDay>? workingDays;

	const WorkingDaysModel({this.workingDays});

	factory WorkingDaysModel.fromJson(Map<String, dynamic> json) {
		return WorkingDaysModel(
			workingDays: (json['working_days'] as List<dynamic>?)
						?.map((e) => WorkingDay.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'working_days': workingDays?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [workingDays];
}
