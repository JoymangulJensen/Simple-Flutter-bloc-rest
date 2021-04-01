import 'package:equatable/equatable.dart';

abstract class TemperatureEvent extends Equatable {
  const TemperatureEvent();
}

class TemperatureRequested extends TemperatureEvent {
  const TemperatureRequested();

  @override
  List<Object> get props => [];
}
