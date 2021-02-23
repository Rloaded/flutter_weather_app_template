import 'package:flutter/material.dart';
import 'package:weather_app_example/bloc/bloc.dart';
import 'package:weather_icons/weather_icons.dart';

/// Bildet den Hauptinfobereich der App.
/// Zeigt das entsprechende Icon, Temperatur und Beschreibung,
/// sowie Luftfeuchtigkeit, Windgeschwindigkeit und Luftdruck.
class InfoCard extends StatefulWidget {
  InfoCard({Key key}) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
