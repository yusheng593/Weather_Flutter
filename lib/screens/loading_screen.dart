import 'dart:convert';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiKey = '46879070762f76cddb7b167292799b80';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    // getLocationData();
  }

  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkingHelper networkingHelper = NetworkingHelper(
        openWeatherUrl:
            'https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=$longitude&exclude={part}&appid=$apiKey');
    var weatherData = await networkingHelper.getData();
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold();
  }
}
