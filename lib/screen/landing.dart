import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Component/reusable_card.dart';
import 'package:weather_app/Services/location.dart';
import '../Component/reusable_child_card.dart';
import '../Component/bottom_reusable_card.dart';
import '../Services/network.dart';

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
    Network network = Network(
        url: 'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.latitude}&appid=02dd9bf4e29b7cf7f62b340af401cf62&units=metric');
    weatherData = await network.getWeatherData();
  }

  List<Image> imageList = [
    Image.asset('images/ClearSky.png'),
    Image.asset('images/Clouds.png'),
    Image.asset('images/Drizzle.png'),
    Image.asset('images/Rain.png'),
    Image.asset('images/Snow.png'),
    Image.asset('images/Thunder.png'),
  ];

  Image getImage() {
    if (weatherData['weather'][0]['main'] == 'Thunderstorm') {
      return imageList[5];
    } else if (weatherData['weather'][0]['main'] == 'Drizzle') {
      return imageList[2];
    } else if (weatherData['weather'][0]['main'] == 'Rain') {
      return imageList[3];
    } else if (weatherData['weather'][0]['main'] == 'Snow') {
      return imageList[4];
    } else if (weatherData['weather'][0]['main'] == 'Clear') {
      return imageList[0];
    } else {
      return imageList[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFEFEFE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                child: Text(
                  'City : ${weatherData['name']}',
                  style: GoogleFonts.getFont(
                    'Architects Daughter',
                    textStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              childWidget: getImage(),
              color: Color(0xFFFDFDFD),
              padding: 20,
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              color: Color(0xFFFDFDFD),
              childWidget: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Image.network('http://openweathermap.org/img/wn/${weatherData['weather'][0]['icon']}@2x.png'),
                          ),
                        ),
                        Expanded(
                          child: ReusableChildCard(
                            label: weatherData['weather'][0]['description'],
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: ReusableChildCard(
                            label: '${weatherData['main']['temp'].round()}\u00B0',
                            fontSize: 90,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              'Feels Like ${weatherData['main']['feels_like'].round()}\u00B0',
                              style: GoogleFonts.getFont(
                                'Architects Daughter',
                                textStyle: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              color: Color(0xFFFDFDFD),
              childWidget: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ReusableChildCard(
                            label: 'Wind',
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Expanded(
                          child: BottomChildReusableCard(
                            label: '${weatherData['wind']['speed']} m/s',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ReusableChildCard(
                            label: 'Humidity',
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Expanded(
                          child: BottomChildReusableCard(
                            label: '${weatherData['main']['humidity']} %',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ReusableChildCard(
                            label: 'Visibility',
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Expanded(
                          child: BottomChildReusableCard(
                            label: '${weatherData['visibility']} m ',
                          ),
                        ),
                      ],
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
}
