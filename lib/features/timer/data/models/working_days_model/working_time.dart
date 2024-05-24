import 'package:equatable/equatable.dart';

class WorkingTime extends Equatable {
	final int? dayId;
	final String? timeFrom;
	final String? timeTo;

	const WorkingTime({this.dayId, this.timeFrom, this.timeTo});

	factory WorkingTime.fromJson(Map<String, dynamic> json) => WorkingTime(
				dayId: json['day_id'] as int?,
				timeFrom: json['time_from'] as String?,
				timeTo: json['time_to'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'day_id': dayId,
				'time_from': timeFrom,
				'time_to': timeTo,
			};

	@override
	List<Object?> get props => [dayId, timeFrom, timeTo];
}
