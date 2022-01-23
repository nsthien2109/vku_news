import 'package:flutter/material.dart';
import 'package:vku_news/screens/home/widget/home_header.dart';
import 'package:vku_news/screens/weather/widget/exchange_money.dart';
import 'package:vku_news/screens/weather/widget/loading_weather.dart';
import 'package:vku_news/screens/weather/widget/main_weather.dart';

class WeatherScreen extends StatefulWidget {
  bool? isLoading;
  WeatherScreen({required this.isLoading});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.isLoading == true ? const LoadingWeather()
          : SafeArea(
            child: SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HomeHeader(title: "Weather", subTitle: "Weather & money for you life"),
                          const SizedBox(height: 50),
                          const MainWeather(),
                          const SizedBox(height: 30),
                          const ExchangeMoney()
                        ],
                     ),
                ),
            ),
          ),
    );
  }
}
