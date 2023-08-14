import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Delhi", "Chennai", "Bhilai", "Raipur"];
    final _random = Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map? info = ModalRoute.of(context)!.settings.arguments as Map;
    String icon_value = info['icon'].toString();
    String hum = info['humidity'];
    String air = info['airspeed'].toString().substring(0, 4);
    String des = info['description'];
    String city_value = info['city'];
    print(icon_value);
    String temp = (info['temperature']).toString().substring(0, 4);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.white,
                Colors.blue,
              ],
            )),
            // margin: EdgeInsets.all(12.0),
            padding: EdgeInsets.all(14.0),
            child: Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[300]),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if ((search.text).replaceAll(" ", "") == "") {
                          print("Blank search");
                        } else {
                          print(search.text);
                          Navigator.pushReplacementNamed(context, '/loading',
                              arguments: {
                                "city_value": search.text,
                              });
                        }
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextField(
                        controller: search,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search $city",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 30.0),
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Image.network(
                              "https://openweathermap.org/img/wn/${icon_value}@2x.png"),
                          Column(
                            children: [
                              Text(
                                "$des",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "In $city_value",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 220.0,
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.all(26.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            WeatherIcons.thermometer,
                            size: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$temp",
                                style: TextStyle(
                                  fontSize: 90,
                                ),
                              ),
                              Text(
                                "C",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            WeatherIcons.day_windy,
                            size: 30,
                          ),
                          SizedBox(
                            height: 30,
                            width: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$air",
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                              Text(
                                "km/hr",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            WeatherIcons.humidity,
                            size: 30,
                          ),
                          SizedBox(
                            height: 30,
                            width: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$hum",
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                              Text(
                                "%",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Created By Kishlay",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Data provided by Openweatherapi.org",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
