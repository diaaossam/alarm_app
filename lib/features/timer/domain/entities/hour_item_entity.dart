import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HourItemEntity extends Equatable {
  final TextEditingController from;
  final TextEditingController to;

  const HourItemEntity({required this.from, required this.to});

  @override
  List<Object> get props => [from, to];

}
