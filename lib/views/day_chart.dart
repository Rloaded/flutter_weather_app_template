import 'package:flutter/material.dart';
import 'package:weather_app_example/bloc/bloc.dart';


/// Zeigt den minimalen und maximalen Temperaturwert des Tages an.
class DayChart extends StatefulWidget {
  DayChart({Key key}) : super(key: key);

  @override
  _DayChartState createState() => _DayChartState();
}

class _DayChartState extends State<DayChart> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
      },
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
