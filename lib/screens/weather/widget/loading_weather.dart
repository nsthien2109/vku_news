import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';


class LoadingWeather extends StatelessWidget {
  const LoadingWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String imageLoading = 'assets/images/WEATHER.svg';
    final Widget svg = SvgPicture.asset(
        imageLoading,
        semanticsLabel: 'Weather'
    );
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          svg,
          const SizedBox(height: 5),
          const CircularProgressIndicator(
            color: primaryColor,
            strokeWidth: 1.5,
          ),
          const SizedBox(height: 15),
          const Text("Loading , wait a minute please ...",style: TextStyle(
              color: greyDarker,
              fontSize: 20,
              fontFamily: FontFamily.SourceSansPro
          ))
        ],
      ),
    );
  }
}
