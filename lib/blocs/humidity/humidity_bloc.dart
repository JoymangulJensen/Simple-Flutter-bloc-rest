import 'package:poc_fo/blocs/blocs.dart';
import 'package:poc_fo/models/models.dart';
import 'dart:async';
import 'package:poc_fo/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class HumidityBloc extends Bloc<HumidityEvent, HumidityState>{
  HumidityRepository humidityRepository;

  HumidityBloc ({@required this.humidityRepository}) :
        assert(humidityRepository != null),
        super(HumidityInitial());

  @override
  Stream<HumidityState> mapEventToState(
      HumidityEvent event) async*{
    if(event is HumidityFetched){
      yield HumidityLoadInProgress();
       try{
         final Humidity humidity = await humidityRepository.GetOneHumidity(id: event.humidityId);
         yield HumidityLoadSuccess(humidity : humidity);
       } catch(_){
         yield HumdidityFailure();
       }
    }
  }

}