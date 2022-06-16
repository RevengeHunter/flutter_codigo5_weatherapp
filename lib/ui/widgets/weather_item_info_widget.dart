import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_weatherapp/models/forecast_model.dart';

import '../general/colors.dart';

class WeatherItemInfoWidget extends StatelessWidget {

  ForeCastModel foreCastModel;
  WeatherItemInfoWidget({required this.foreCastModel,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0,),
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0,),
      decoration: BoxDecoration(
        color: kContainerPrimaryColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.06),
            blurRadius: 10,
            offset: Offset(5,5),
          ),
        ]
      ),
      child: Column(
        children: [
          Text(
            foreCastModel.dtTxt.toString().substring(11,16),
            style: TextStyle(
              color: Color(0xffADB6B7),
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 12.0,),
          Image.asset(
              'assets/images/${foreCastModel.weather[0].description}.png',
            height: 34.0,
            color: Colors.white,
          ),
          const SizedBox(height: 12.0,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foreCastModel.main.temp.toStringAsFixed(0),
                style: TextStyle(
                  color: kTextPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Text(
                "ºC",
                style: TextStyle(
                  color: kTextPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}