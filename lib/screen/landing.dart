import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Component/reusable_card.dart';
import 'package:weather_app/Services/location.dart';
import '../Component/reusable_child_card.dart';
import '../Component/bottom_reusable_card.dart';
import '../Services/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../screen/weather_data.dart';

var weatherData;

class TodaysWeather extends StatefulWidget {
  @override
  _TodaysWeatherState createState() => _TodaysWeatherState();
}

class _TodaysWeatherState extends State<TodaysWeather> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //call GetLocation At start
    getLocationData();
  }

  Future<void> getLocationData() async {
    Location location = Location();
    await location.getPositionData();
    print(location.longitude);
    Network network = Network(
        url: 'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=02dd9bf4e29b7cf7f62b340af401cf62&units=metric');
    weatherData = await network.getWeatherData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherDataScreen(
          weatherData: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitPouringHourglass(
        color: Colors.black,
        size: 80,
        duration: Duration(seconds: 1),
      ),
    );
  }
}
