import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../general/colors.dart';

class WeatherItemInfoWidget extends StatelessWidget {

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
            "9:00 AM",
            style: TextStyle(
              color: Color(0xffADB6B7),
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 12.0,),
          Image.asset(
            'assets/images/cloud.png',
            height: 34.0,
            color: Colors.white,
          ),
          const SizedBox(height: 12.0,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "29",
                style: TextStyle(
                  color: kTextPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Text(
                "º",
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