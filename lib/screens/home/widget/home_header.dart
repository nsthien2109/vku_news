import 'package:flutter/material.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class HomeHeader extends StatelessWidget {
  String title;
  String subTitle;
  HomeHeader({required this.title,required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: const TextStyle(
          color: blackPrimary,
          fontSize: 30,
          fontFamily: FontFamily.SourceSansPro,
          fontWeight: FontWeight.w600
        )),
        const SizedBox(height: 20),
        Text(subTitle,style: const TextStyle(color: greyPrimary,fontWeight: FontWeight.w400,fontFamily: FontFamily.SourceSansPro,fontSize: 20)),
      ],
    );
  }
}
