import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_example/bloc/bloc.dart';
import 'package:weather_app_example/data/state_data.dart';


/// Dieses Widget zeichnet die horizontal-scrollende Liste. 
/// Welche ausgewählt werden können um das Wetter an diesem Tag anzuzeigen.
class DayScroll extends StatefulWidget {
  DayScroll({Key key}) : super(key: key);

  @override
  _DayScrollState createState() => _DayScrollState();
}

class _DayScrollState extends State<DayScroll> {
  final double _itemWidth = 115;

  final DateFormat dateFormat = DateFormat("dd/MM");

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    final index = BlocProvider.of<WeatherBloc>(context).state.data.currentDay;
    _scrollToIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is DayChanged) {
          _scrollToIndex(state.data.currentDay);
        }
        else if (state is DataLoaded) {
          _scrollToIndex(state.data.currentDay);
        }
      },
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          // Ab hier Layout bauen
          return Container();
        },
      ),
    );
  }
  
  // Regelt das onTap Verhalten der nicht ausgewählten Listenelementen.
  void _onTap(index, context) {
    BlocProvider.of<WeatherBloc>(context).add(
      ChangeDay(
        newCurrentDay: index,
      ),
    );
  }

  /// Scrollt zum Listenelement an der Stelle [index].
  /// Nachdem das Widget fertig gebaut wurde.
  void _scrollToIndex(index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _doScroll(index);
    });
  }

  /// Führt den eigentlich scroll durch.
  void _doScroll(index) {
    _controller.animateTo(
      index * _itemWidth,
      duration: Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  /// Erstellt eine Liste aller Wochentagsangaben aus [weatherInfo].
  List<String> _getListOfTitles(List<WeatherInfo> weatherInfo) {
    List<String> listOfTitles = List<String>();
    for (var info in weatherInfo) {
      listOfTitles.add(info.dayName);
    }
    return listOfTitles;
  }
}
