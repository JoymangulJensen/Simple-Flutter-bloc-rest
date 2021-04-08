import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:poc_fo/models/models.dart';
import 'package:poc_fo/repositories/repositories.dart';

part 'co2_event.dart';
part 'co2_state.dart';

class Co2Bloc extends Bloc<Co2Event, Co2State> {
  final Co2Repository co2Repository;

  Co2Bloc({@required this.co2Repository})
      : assert(co2Repository != null),
        super(Co2Initial());

  @override
  Stream<Co2State> mapEventToState(Co2Event event) async* {
    if (event is Co2Requested) {
      yield Co2LoadInProgress();
      try {
        final Co2 co2 = await co2Repository.GetOneCo2(id: event.id);
        yield Co2LoadSuccess(co2: co2);
      } catch (_) {
        yield Co2LoadFailure();
      }
    }
  }
}