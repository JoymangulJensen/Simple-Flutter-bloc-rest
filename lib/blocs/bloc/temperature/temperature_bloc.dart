import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poc_fo/blocs/bloc/temperature/temperature_event.dart';
import 'package:poc_fo/blocs/bloc/temperature/temperature_state.dart';
import 'package:poc_fo/models/models.dart';
import 'package:poc_fo/repositories/repositories.dart';

class TemperatureBloc extends Bloc<TemperatureEvent, TemperatureState> {
  final TemperatureRepository temperatureRepository;

  TemperatureBloc({@required this.temperatureRepository})
      : assert(temperatureRepository != null),
        super(TemperatureInitial());

  @override
  Stream<TemperatureState> mapEventToState(TemperatureEvent event,) async* {
    if (event is TemperatureRequested) {
      yield TemperatureLoadInProgress();
      try {
        final Temperature temperature = await temperatureRepository.fetchTemperature(id:event.id);
        yield TemperatureLoadSuccess(temperature: temperature);
      } catch (_) {
        yield TemperatureLoadFailure();
      }
    }
  }
}
