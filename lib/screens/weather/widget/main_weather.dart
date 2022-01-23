import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/providers/weather_provider.dart';
import 'package:vku_news/screens/weather/widget/weather_detail.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class MainWeather extends StatefulWidget {
  const MainWeather({Key? key}) : super(key: key);

  @override
  _MainWeatherState createState() => _MainWeatherState();
}

class _MainWeatherState extends State<MainWeather> {
  @override
  Widget build(BuildContext context) {
    const String sundy = "assets/images/Sunny.svg";
    final Widget SundyIcon = SvgPicture.asset(
        sundy,
        width: 250,
        semanticsLabel: 'Weather'
    );

    return Consumer<WeatherProvider>(
        builder: (context,weatherData,_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherDetail())),
              child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: greyLighter,
                      border: Border.all(
                          color: greyLight,
                          width: 0.5
                      ),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex : 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration : BoxDecoration(
                                      color : purpleLight,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text(weatherData.weather.location!.name.toString(),style: const  TextStyle(
                                      fontFamily: FontFamily.SourceSansPro,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: white
                                    )),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(weatherData.weather.current!.temperature.toString() + "°C",style: const TextStyle(
                                      color: blackPrimary,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: FontFamily.SourceSansPro
                                  )),
                                  const SizedBox(height: 15),
                                  Text(weatherData.weather.current!.weatherDescriptions![0],style: const TextStyle(
                                      color: blackPrimary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontFamily.SourceSansPro
                                  )),
                                ],
                              )
                          ),
                          Expanded(
                              flex : 3,
                              child: SundyIcon
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          Container(
                            padding : const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 0.7,
                                    color: purpleLighter
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.invert_colors_outlined,size: 20,color: white),
                                const SizedBox(width: 5),
                                Text(weatherData.weather.current!.humidity.toString() +"%",style: const TextStyle(
                                    color: white,
                                    fontSize: 20,
                                    fontFamily: FontFamily.SourceSansPro
                                ))
                              ],
                            ),
                          ),
                          Container(
                            padding : const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.tealAccent,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 0.7,
                                    color: purpleLighter
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.air_outlined,size: 20,color: greyDarker),
                                const SizedBox(width: 5),
                                Text(weatherData.weather.current!.windSpeed.toString() + "km/h",style: const TextStyle(
                                    color: greyDarker,
                                    fontSize: 20,
                                    fontFamily: FontFamily.SourceSansPro
                                ))
                              ],
                            ),
                          ),
                          Container(
                            padding : const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 0.7,
                                    color: purpleLighter
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.disc_full_outlined,size: 20,color: greyDarker),
                                const SizedBox(width: 5),
                                Text(weatherData.weather.current!.uvIndex.toString() + " UV",style: const TextStyle(
                                    color: greyDarker,
                                    fontSize: 20,
                                    fontFamily: FontFamily.SourceSansPro
                                ))
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ),
          ],
        )
    );
  }
}
