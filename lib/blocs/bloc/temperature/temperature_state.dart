import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:poc_fo/models/models.dart';

abstract class TemperatureState extends Equatable {
  const TemperatureState();

  @override
  List<Object> get props => [];
}

class TemperatureInitial extends TemperatureState {}

class TemperatureLoadInProgress extends TemperatureState {}

class TemperatureLoadSuccess extends TemperatureState {
  final Temperature temperature;

  const TemperatureLoadSuccess({@required this.temperature})
      : assert(temperature != null);

  @override
  List<Object> get props => [temperature];
}

class WeatherLoadFailure extends TemperatureState {}
