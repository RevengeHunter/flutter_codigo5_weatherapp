import 'dart:convert';

import 'package:flutter_codigo5_weatherapp/models/forecast_model.dart';
import 'package:flutter_codigo5_weatherapp/models/weather_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../utils/const.dart';

class ApiService{

  //Crear Modelo
  //Terminar de Implementar la Funcion

  Future<WeatherModel?> getDataWeather(String ciudad) async{
    String path = "https://api.openweathermap.org/data/2.5/weather?q=$ciudad&appid=$keyApi";
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
    String path = "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$keyApi";
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

  Future<List<ForeCastModel>> getDataWeatherForecast(Position position) async{
    String path = "https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&cnt=10&appid=$keyApi";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String, dynamic> result = json.decode(response.body);
      List weatherList = result["list"];
      List<ForeCastModel> foreCastModel = weatherList.map((e) => ForeCastModel.fromJson(e)).toList();
      print(foreCastModel[0].weather[0].description);
      return foreCastModel;
    }
    return [];
  }
}