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
              return new Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.all(10),
                      child: Text(state.patient.toJson().toString()),
                    ),
                    Center(
                      child: new Container(
                        child: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            new Container(
                              padding: EdgeInsets.all(5),
                              child: ElevatedButton(
                                // Within the `FirstScreen` widget
                                onPressed: () {
                                  // Navigate to the second screen using a named route.
                                  Navigator.pushNamed(context, '/co2');
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey),
                                ),
                                child: Text('Co2'),
                              ),
                            ),
                            new Container(
                              padding: EdgeInsets.all(5),
                              child: ElevatedButton(
                                // Within the `FirstScreen` widget
                                onPressed: () {
                                  // Navigate to the second screen using a named route.
                                  Navigator.pushNamed(context, '/humidity');
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blueGrey),
                                ),
                                child: Text('Humidité'),
                              ),
                            ),
                            new Container(
                              padding: EdgeInsets.all(5),
                              child: ElevatedButton(
                                // Within the `FirstScreen` widget
                                onPressed: () {
                                  // Navigate to the second screen using a named route.
                                  Navigator.pushNamed(context, '/temperature');
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.teal[400]),
                                ),
                                child: Text('Température'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
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
