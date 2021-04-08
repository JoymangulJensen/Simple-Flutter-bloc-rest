part of 'co2_bloc.dart';

abstract class Co2State extends Equatable {
  const Co2State();
}

class Co2Initial extends Co2State {
  @override
  List<Object> get props => [];
}

class Co2LoadInProgress extends Co2State {
  @override
  List<Object> get props => [];
}

class Co2LoadSuccess extends Co2State {
  final Co2 co2;

  const Co2LoadSuccess({@required this.co2}) : assert(co2 != null);

  @override
  List<Object> get props => [co2];
}

class Co2LoadFailure extends Co2State {
  @override
  List<Object> get props => [];
}