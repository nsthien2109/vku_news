import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/providers/weather_provider.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';



class WeatherDetail extends StatefulWidget {
  const WeatherDetail({Key? key}) : super(key: key);

  @override
  _WeatherDetailState createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  @override
  Widget build(BuildContext context) {
    const String imageWeather = "assets/images/Rainy.svg";
    final Widget IconWeather = SvgPicture.asset(
        imageWeather,
        width: double.infinity,
        semanticsLabel: 'Weather'
    );
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Consumer<WeatherProvider>(
              builder: (context , dataWeather , _) => Container(
                width: double.infinity,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: greyLighter,
                    border: Border.all(
                        color: purpleLighter
                    ),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Location
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: purpleLight,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                          const Icon(Icons.location_on_outlined,size: 15,color: white),
                          const SizedBox(width: 5),
                          Text(dataWeather.weather.request!.query.toString(),style: const TextStyle(
                              color: white,
                              fontSize: 15,
                              fontFamily: FontFamily.SourceSansPro,
                              fontWeight: FontWeight.w500
                          )),
                        ],
                      ),
                    ),
                    //IMag
                    SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: IconWeather
                    ),
                    const SizedBox(height: 30),
                    //Temperature
                    Text(dataWeather.weather.current!.temperature.toString() + "°C",style: const TextStyle(
                        color: blackPrimary,
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamily.SourceSansPro
                    )),
                    // Weather status
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: purpleDarker,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Text(dataWeather.weather.current!.weatherDescriptions![0].toString(),style: const TextStyle(
                          color: white,
                          fontSize: 15,
                          fontFamily: FontFamily.SourceSansPro,
                          fontWeight: FontWeight.w500
                      )),
                    ),
                    //List detail weather
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      height: 300,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width / 4.8,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: purpleLight
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:  [
                                    const Icon(Icons.thermostat_outlined , color: Colors.red,size: 30),
                                    Text(dataWeather.weather.current!.feelslike.toString() + "°C",style: const TextStyle(
                                        color: blackPrimary,
                                        fontSize: 25,
                                        fontFamily: FontFamily.SourceSansPro,
                                        fontWeight: FontWeight.w500
                                    )),
                                    const Text("Feel like",style: TextStyle(
                                        color: greyDarker,
                                        fontSize: 13,
                                        fontFamily: FontFamily.SourceSansPro
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width / 4.8,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: purpleLight
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.air_outlined , color: Colors.teal,size: 30),
                                    Text(dataWeather.weather.current!.windSpeed.toString() + "km/h",style: const TextStyle(
                                        color: blackPrimary,
                                        fontSize: 25,
                                        fontFamily: FontFamily.SourceSansPro,
                                        fontWeight: FontWeight.w500
                                    )),
                                    const Text("Wind speech",style: TextStyle(
                                        color: greyDarker,
                                        fontSize: 13,
                                        fontFamily: FontFamily.SourceSansPro
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width / 4.8,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: purpleLight
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:  [
                                    const Icon(Icons.invert_colors_outlined, color: Colors.cyan,size: 30),
                                    Text(dataWeather.weather.current!.humidity.toString() + "%",style: const TextStyle(
                                        color: blackPrimary,
                                        fontSize: 25,
                                        fontFamily: FontFamily.SourceSansPro,
                                        fontWeight: FontWeight.w500
                                    )),
                                    const Text("Humidity",style: TextStyle(
                                        color: greyDarker,
                                        fontSize: 13,
                                        fontFamily: FontFamily.SourceSansPro
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width / 4.8,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: purpleLight
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:  [
                                    const Icon(Icons.favorite_border_outlined , color: Colors.pink,size: 30),
                                    Text(dataWeather.weather.current!.uvIndex.toString(),style: const TextStyle(
                                        color: blackPrimary,
                                        fontSize: 25,
                                        fontFamily: FontFamily.SourceSansPro,
                                        fontWeight: FontWeight.w500
                                    )),
                                    const Text("UV Index",style: TextStyle(
                                        color: greyDarker,
                                        fontSize: 13,
                                        fontFamily: FontFamily.SourceSansPro
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width / 4.8,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: purpleLight
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:  [
                                    const Icon(Icons.grain_outlined , color: Colors.lightBlueAccent,size: 30),
                                    Text(dataWeather.weather.current!.precip.toString() + "%",style: const TextStyle(
                                        color: blackPrimary,
                                        fontSize: 25,
                                        fontFamily: FontFamily.SourceSansPro,
                                        fontWeight: FontWeight.w500
                                    )),
                                    const Text("Precip",style: TextStyle(
                                        color: greyDarker,
                                        fontSize: 13,
                                        fontFamily: FontFamily.SourceSansPro
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width / 4.8,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: purpleLight
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.cloud_queue_outlined , color: purpleLight ,size: 30),
                                    Text(dataWeather.weather.current!.cloudcover.toString(),style: const TextStyle(
                                        color: blackPrimary,
                                        fontSize: 25,
                                        fontFamily: FontFamily.SourceSansPro,
                                        fontWeight: FontWeight.w500
                                    )),
                                    const Text("Cloud",style: TextStyle(
                                        color: greyDarker,
                                        fontSize: 13,
                                        fontFamily: FontFamily.SourceSansPro
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width / 4.8,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: purpleLight
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.alt_route_outlined, color: Colors.lightGreen,size: 30),
                                    Text(dataWeather.weather.current!.windDir.toString(),style: const TextStyle(
                                        color: blackPrimary,
                                        fontSize: 25,
                                        fontFamily: FontFamily.SourceSansPro,
                                        fontWeight: FontWeight.w500
                                    )),
                                    const Text("Wind Direct",style: TextStyle(
                                        color: greyDarker,
                                        fontSize: 13,
                                        fontFamily: FontFamily.SourceSansPro
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                height: 130,
                                width: MediaQuery.of(context).size.width / 4.8,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: purpleLight
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:  [
                                    const Icon(Icons.history_outlined , color: Colors.deepOrangeAccent,size: 30),
                                    Text(dataWeather.weather.current!.observationTime.toString(),style: const TextStyle(
                                        color: blackPrimary,
                                        fontSize: 23,
                                        fontFamily: FontFamily.SourceSansPro,
                                        fontWeight: FontWeight.w500
                                    )),
                                    const Text("Time update",style: TextStyle(
                                        color: greyDarker,
                                        fontSize: 13,
                                        fontFamily: FontFamily.SourceSansPro
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          )
      ),
    );
  }
}
