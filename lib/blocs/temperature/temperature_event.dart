import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TemperatureEvent extends Equatable {
  const TemperatureEvent();
}

class TemperatureRequested extends TemperatureEvent {

  final id  ;
  const TemperatureRequested({@required this.id});
  @override
  List<Object> get props => [id];
}
