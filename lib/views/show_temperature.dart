import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_fo/blocs/bloc/temperature/temperature_bloc.dart';
import 'package:poc_fo/blocs/bloc/temperature/temperature_event.dart';
import 'package:poc_fo/blocs/bloc/temperature/temperature_state.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature page"),
      ),
      body: Center(
        child: BlocBuilder<TemperatureBloc, TemperatureState>(
            builder: (context, state) {
              if (state is TemperatureInitial) {
                BlocProvider.of<TemperatureBloc>(context).add(TemperatureRequested(id: 1));
              }


              if (state is TemperatureLoadSuccess) {
                return Text(state.temperature.toJson().toString());
              }
              if (state is TemperatureLoadFailure) {
                return Text("Failed");
              }
              return Column(
                children: [
                  CircularProgressIndicator(),
                ],
              );
            }
        ),
      ),
    );
  }
}