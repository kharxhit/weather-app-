import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class weatherData {
  String? location;
  String? temperature;
  String? humidity;
  String? airspeed;
  String? description;
  String? icon;

  weatherData({required this.location});

  Future<void> getData() async {
    try {
      String api_key = "APIKEY";
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$api_key");
      var response = await http.get(url);
      Map data = convert.jsonDecode(response.body);
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;
      // print(temp_data);
      Map wind = data['wind'];
      double getAir_speed = wind['speed'] / 0.27777777778;

      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDes = weather_main_data["description"];

      temperature = getTemp.toString();
      humidity = getHumidity;
      airspeed = getAir_speed.toString();
      description = getDes;
      icon = weather_main_data['icon'].toString();

      print(data);
    } catch (e) {
      temperature = "  NA";
      humidity = "NA";
      airspeed = "0.00";
      description = "No Such Place";
      icon = "09d";
      print(e.toString());
    }
  }
}
