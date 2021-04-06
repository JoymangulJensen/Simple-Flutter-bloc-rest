import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HumidityEvent extends Equatable {
 const HumidityEvent();
}

  class HumidityFetched extends HumidityEvent{
    final humidityId;

    const HumidityFetched({@required this.humidityId});

    @override
    List<Object> get props => [humidityId];
  }




