import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:poc_fo/models/models.dart';

abstract class HumidityState extends Equatable {
  const HumidityState();

}
  class HumidityInitial extends HumidityState{
    @override
    List<Object> get props => [];
  }

  class HumidityLoadInProgress extends HumidityState{

    @override
    List<Object> get props => [];
  }

  class HumidityLoadSuccess extends HumidityState{
    final Humidity  humidity;
    const HumidityLoadSuccess({@required this.humidity}) : assert (humidity != null);

    @override
    List<Object> get props => [humidity];
  }

  class HumdidityFailure extends HumidityState{
    @override
    List<Object> get props => [];
  }