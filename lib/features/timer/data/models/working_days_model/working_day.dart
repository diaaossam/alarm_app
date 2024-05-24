import 'package:equatable/equatable.dart';

import 'working_time.dart';

class WorkingDay extends Equatable {
	final int? dayId;
	int? isHoliday;
	final List<WorkingTime>? workingTimes;
	final bool isTitle;

	 WorkingDay({this.dayId, this.isHoliday, this.workingTimes , this.isTitle = false});

	factory WorkingDay.fromJson(Map<String, dynamic> json) => WorkingDay(
				dayId: json['day_id'] as int?,
				isHoliday: json['is_holiday'] as int?,
				workingTimes: (json['working_times'] as List<dynamic>?)
						?.map((e) => WorkingTime.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'day_id': dayId,
				'is_holiday': isHoliday,
				'working_times': workingTimes?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [dayId, isHoliday, workingTimes];
}
