import 'package:equatable/equatable.dart';

abstract class Co2Event extends Equatable {
  const Co2Event();
}

class Co2Requested extends Co2Event {

  const Co2Requested();

  @override
  List<Object> get props => [];
}