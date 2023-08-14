import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:proj_2/worker/weather.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var temp, hum, air_speed, des, main, icon;
  String city = "Bhilai";
  // ignore: non_constant_identifier_names
  void startApp(String city_name) async {
    weatherData instance = weatherData(location: city_name);
    await instance.getData();
    temp = instance.temperature;
    hum = instance.humidity;
    air_speed = instance.airspeed;
    des = instance.description;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'temperature': temp,
        'humidity': hum,
        'airspeed': air_speed,
        'description': des,
        'icon': icon,
        'city': city_name,
      });
    });
    print("Success");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("init state called");
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)!.settings.arguments as Map?;
    if (search?.isNotEmpty ?? false) {
      city = search!['city_value'];
      startApp(city);
    } else {
      startApp("Bhilai");
    }
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'images/logo.jpg',
                width: 160.0,
                height: 160.0,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Weather App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Created by Kishlay",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            SpinKitWave(
              color: Colors.white,
              size: 40.0,
            ),
          ]),
        ),
        backgroundColor: Colors.blue[700],
      ),
    );
  }
}
