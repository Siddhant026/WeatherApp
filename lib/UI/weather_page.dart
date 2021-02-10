import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reso_bloc1/models/weather_model.dart';

class WeatherPage extends StatelessWidget {
  final Weather weather;
  const WeatherPage({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          bottom: height / 2.4,
          child: Image.network(
            'https://i.ibb.co/Y2CNM8V/new-york.jpg',
            height: height,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: height / 2.4,
            width: width,
            color: Color(0xFF2D2C35),
          ),
        ),
        Foreground(weather: weather,)
      ],
    );
  }
}

class Foreground extends StatelessWidget {
  final Weather weather;
  const Foreground({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.ibb.co/Z1fYsws/profile-image.jpg',
              ),
              backgroundColor: Colors.black26,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: DefaultTextStyle(
          style: GoogleFonts.raleway(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Text(
                '${weather.name}',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 5),
              Text(
                '${weather.weather[0].main}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: height / 4.5),
              Text(
                '${(weather.main.temp - 273.15).toInt()}°',
                style: TextStyle(fontSize: 90),
              ),
              SizedBox(height: 50),
              Text(
                'Weather Details',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              Details(property: 'Pressure', value: '${weather.main.pressure} Pa',),
              SizedBox(height: 5),
              Details(property: 'Humidity', value: '${weather.main.humidity} %',),
              SizedBox(height: 5),
              Details(property: 'Visibility', value: '${weather.visibility} m',),
              SizedBox(height: 5),
              Details(property: 'Wind Speed', value: '${weather.wind.speed} m/sec',),
              // SizedBox(height: 5),
              // Details(property: 'Wind Degree', value: '${weather.wind.deg}°',),
            ],
          ),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String property;
  final String value;
  const Details({
    Key key, @required this.property, @required this.value
  }) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 40),
        Text(
          '$property',
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 15,
          ),
        ),
        Expanded(child: Container()),
        Text(
          '$value',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(width: 40),
      ],
    );
  }
}
