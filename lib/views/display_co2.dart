import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_fo/blocs/blocs.dart';

class ShowCO2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Co2 data"),
      ),
      body: Center(
        child: BlocBuilder<Co2Bloc, Co2State>(
          builder: (context, state) {
            if (state is Co2Initial) {
              BlocProvider.of<Co2Bloc>(context).add(Co2Requested(id: 1));
            }
            if (state is Co2LoadSuccess) {
              return Text(state.co2.toJson().toString());
            }
            if (state is Co2LoadFailure) {
              return Text('Co2 data not loaded');
            }
            return Column(
              children: [
                CircularProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
}
