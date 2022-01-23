import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vku_news/providers/account_provider.dart';
import 'package:vku_news/providers/bookmark_provider.dart';
import 'package:vku_news/providers/category_provider.dart';
import 'package:vku_news/providers/comment_provider.dart';
import 'package:vku_news/providers/exchange_provider.dart';
import 'package:vku_news/providers/post_provider.dart';
import 'package:vku_news/providers/recommended_provider.dart';
import 'package:vku_news/providers/slide_provider.dart';
import 'package:vku_news/providers/weather_provider.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/widgets/on_boarding_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: purpleLight)
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CategoryProvider()),
        ChangeNotifierProvider(create: (_)=> SlideProvider()),
        ChangeNotifierProvider(create: (_)=> ReProvider()),
        ChangeNotifierProvider(create: (_)=> PostProvider()),
        ChangeNotifierProvider(create: (_)=> AccountProvider()),
        ChangeNotifierProvider(create: (_)=> CommentProvider()),
        ChangeNotifierProvider(create: (_)=> WeatherProvider()),
        ChangeNotifierProvider(create: (_)=> ExchangeProvider()),
        ChangeNotifierProvider(create: (_)=> BookmarkProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VKU News',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OnBoardingScreen(),
      ),
    );
  }
}