import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:poc_fo/models/models.dart';
import 'package:poc_fo/repositories/repositories.dart';
import 'package:poc_fo/blocs/blocs.dart';

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

        final List<Co2> co2list = await co2Repository.GetCo2List();
        yield Co2LoadSuccess(co2: co2list);
      } catch (_) {
        yield Co2LoadFailure();
      }
    }
  }
}