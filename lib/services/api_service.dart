import 'dart:convert';

import 'package:flutter_codigo5_weatherapp/models/weather_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class ApiService{

  //Crear Modelo
  //Terminar de Implementar la Funcion

  Future<WeatherModel?> getDataWeather(String ciudad) async{
    String path = "https://api.openweathermap.org/data/2.5/weather?q=$ciudad&appid=26b61a5d6fee8d50d99e1648018ef754";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String, dynamic> result = json.decode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(result);
      print(weatherModel.weather[0].main);
      return weatherModel;
    }
    return null;
  }

  Future<WeatherModel?> getDataWeatherLocation(Position position) async{
    String path = "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=26b61a5d6fee8d50d99e1648018ef754";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String, dynamic> result = json.decode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(result);
      print(weatherModel.weather[0].main);
      return weatherModel;
    }
    return null;
  }
}