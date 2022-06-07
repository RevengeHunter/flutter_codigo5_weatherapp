import 'package:flutter/material.dart';
import 'package:flutter_codigo5_weatherapp/models/weather_model.dart';
import 'package:flutter_codigo5_weatherapp/services/api_service.dart';
import 'package:flutter_codigo5_weatherapp/ui/general/colors.dart';

import '../ui/widgets/weather_item_info_widget.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ApiService apiService = ApiService();
  final TextEditingController txtCityNameController = TextEditingController();
  WeatherModel? weatherModel;

  @override
  initState(){
    super.initState();
    _getDataWeather();
  }

  _getDataWeather() async{
    String cityName = txtCityNameController.text;
    weatherModel = await apiService.getDataWeather(cityName);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: AppBar(
        title: Text(
          "WeatherApp",
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: kBrandPrimaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.location_on,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14.0,
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Image.asset(
                'assets/images/${weatherModel?.weather[0].icon ?? "ventoso"}.png',
                height: height * 0.16,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                weatherModel?.weather[0].main ?? "Sunny",
                style: TextStyle(
                  color: kTextPrimaryColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherModel?.main.temp.toString() ?? "0.0",
                    style: TextStyle(
                      color: kTextPrimaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  const Text(
                    "ºC",
                    style: TextStyle(
                      color: kTextPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                "${weatherModel?.name}, ${weatherModel?.sys.country}",
                style: TextStyle(
                  color: kTextPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: txtCityNameController,
                decoration: InputDecoration(
                  hintText: "Enter City Name",
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                ),
                onSubmitted: (value){
                  // print("hola");
                  _getDataWeather();

                },
              ),
              const SizedBox(
                height: 18.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    WeatherItemInfoWidget(),
                    WeatherItemInfoWidget(),
                    WeatherItemInfoWidget(),
                    WeatherItemInfoWidget(),
                    WeatherItemInfoWidget(),
                    WeatherItemInfoWidget(),
                    WeatherItemInfoWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 20.0,
                ),
                width: double.infinity,
                height: 120.0,
                decoration: BoxDecoration(
                  color: kContainerPrimaryColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 10,
                      top: -50,
                      child: Image.asset(
                        'assets/images/ventoso.png',
                        scale: 7,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "15 minutes ago",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
