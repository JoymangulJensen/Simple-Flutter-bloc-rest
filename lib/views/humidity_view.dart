
import 'package:poc_fo/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';



class HumidityView extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Humidity')
      ),
      body: Center(
        child: BlocBuilder<HumidityBloc, HumidityState>(
          // ignore: missing_return
          builder: (context, state){
            if(state is HumidityInitial){
              BlocProvider.of<HumidityBloc>(context).add(HumidityFetched(humidityId: 2));
              return Center(child: CircularProgressIndicator());
            }
            if (state is HumidityLoadSuccess){
                return Text(state.humidity.toJson().toString());
            }
            if(state is HumdidityFailure ){
              return Text(' humidity failed');
            }
          },
        ),
      ),
    );
  }
}