import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_fo/blocs/blocs.dart';

class ShowPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Patient"),
      ),
      body: Center(
        child: BlocBuilder<PatientBloc, PatientState>(
          builder: (context, state) {
            if (state is PatientInitial) {
              BlocProvider.of<PatientBloc>(context)
                  .add(FetchPatient(id: 500017));
            }
            if (state is PatientLoadSuccess) {
              return Text(state.patient.toJson().toString());
            }
            if (state is PatientLoadFailure) {
              return Text('Patient not loaded');
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
