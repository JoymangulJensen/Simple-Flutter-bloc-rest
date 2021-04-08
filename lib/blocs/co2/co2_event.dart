part of 'co2_bloc.dart';

abstract class Co2Event extends Equatable {
  const Co2Event();
}

class Co2Requested extends Co2Event {
  final id;
  const Co2Requested({@required this.id});

  @override
  List<Object> get props => [id];
}

