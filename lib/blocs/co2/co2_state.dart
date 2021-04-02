import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:poc_fo/models/models.dart';

abstract class Co2State extends Equatable {
  const Co2State();

  @override
  List<Object> get props => [];
}

class Co2Initial extends Co2State {}

class Co2LoadInProgress extends Co2State {}

class Co2LoadSuccess extends Co2State {
  final List<Co2> co2;

  const Co2LoadSuccess({@required this.co2}) : assert(co2 != null);

  @override
  List<Object> get props => [co2];
}

class Co2LoadFailure extends Co2State {}