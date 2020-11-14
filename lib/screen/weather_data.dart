import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import '../Component/bottom_reusable_card.dart';
import '../Component/reusable_child_card.dart';
import '../Component/reusable_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class WeatherDataScreen extends StatefulWidget {
  final weatherData;
  WeatherDataScreen({this.weatherData});
  @override
  _WeatherDataScreenState createState() => _WeatherDataScreenState();
}

class _WeatherDataScreenState extends State<WeatherDataScreen> {
  // mainImage  :refers to the ImageBanner at the top
  //iconImage :refers to the iconOftheImage
  Image mainImage, iconImage;
  String cityName, description;
  int temperature, feelsLikeTemperature, humidity, visibility;
  double wind;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    mainImage = getImage(weatherData['weather'][0]['main']);
    cityName = weatherData['name'];
    iconImage = Image.network('http://openweathermap.org/img/wn/${weatherData['weather'][0]['icon']}@2x.png');
    description = weatherData['weather'][0]['description'];
    temperature = weatherData['main']['temp'].round();
    feelsLikeTemperature = weatherData['main']['feels_like'].round();
    wind = weatherData['wind']['speed'];
    humidity = weatherData['main']['humidity'];
    visibility = weatherData['visibility'];
  }

  List<Image> imageList = [
    Image.asset('images/ClearSky.png'),
    Image.asset('images/Clouds.png'),
    Image.asset('images/Drizzle.png'),
    Image.asset('images/Rain.png'),
    Image.asset('images/Snow.png'),
    Image.asset('images/Thunder.png'),
  ];

  Image getImage(String weatherCondition) {
    if (weatherCondition == 'Thunderstorm') {
      return imageList[5];
    } else if (weatherCondition == 'Drizzle') {
      return imageList[2];
    } else if (weatherCondition == 'Rain') {
      return imageList[3];
    } else if (weatherCondition == 'Snow') {
      return imageList[4];
    } else if (weatherCondition == 'Clear') {
      return imageList[0];
    } else {
      return imageList[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                      'City : $cityName',
                      style: GoogleFonts.getFont(
                        'Inconsolata',
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ReusableCard(
                  childWidget: mainImage,
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
                                child: iconImage,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 45),
                                child: Center(
                                  child: Text(
                                    '$description',
                                    style: GoogleFonts.getFont(
                                      'Architects Daughter',
                                      textStyle: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ),
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
                                label: '$temperature\u00B0',
                                fontSize: 85,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 20),
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Feels Like $feelsLikeTemperature\u00B0',
                                  style: GoogleFonts.getFont(
                                    'Architects Daughter',
                                    textStyle: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
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
                              child: BottomChildReusableCard(label: '$wind m/s'),
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
                              child: BottomChildReusableCard(label: '$humidity %'),
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
                              child: BottomChildReusableCard(label: '$visibility m '),
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
        ),
      ),
    );
    ;
  }
}
