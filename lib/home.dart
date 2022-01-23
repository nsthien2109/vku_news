import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/providers/account_provider.dart';
import 'package:vku_news/providers/bookmark_provider.dart';
import 'package:vku_news/providers/category_provider.dart';
import 'package:vku_news/providers/exchange_provider.dart';
import 'package:vku_news/providers/recommended_provider.dart';
import 'package:vku_news/providers/slide_provider.dart';
import 'package:vku_news/providers/weather_provider.dart';
import 'package:vku_news/screens/bookmarks/bookmark_screen.dart';
import 'package:vku_news/screens/bookmarks/widget/login_notify.dart';
import 'package:vku_news/screens/category/category_screen.dart';
import 'package:vku_news/screens/home/home_screen.dart';
import 'package:vku_news/screens/login/login_screen.dart';
import 'package:vku_news/screens/profile/profile_screen.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:vku_news/screens/weather/weather_screen.dart';
import 'package:vku_news/styles/colors.dart';

class HomePage extends StatefulWidget {
  int? idCustomer;
  HomePage({Key? key, this.idCustomer}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final _pageController = PageController();

  bool _isLoading = false;

  @override
  void initState(){
    setState(() {
      _isLoading = true;
    });
    Provider.of<AccountProvider>(context, listen: false).checkLogin();
    Provider.of<SlideProvider>(context, listen: false).fetchSlide();
    Provider.of<CategoryProvider>(context, listen: false).fetchCategory();
    Provider.of<WeatherProvider>(context, listen: false).fetchWeather();
    Provider.of<ExchangeProvider>(context,listen: false).fetchExchange();
    Provider.of<ReProvider>(context, listen: false).fetchRePost().then((value){
      setState(() {
        _isLoading = false;
      });
    });
    Timer myTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      Provider.of<SlideProvider>(context, listen: false).fetchSlide();
      Provider.of<CategoryProvider>(context, listen: false).fetchCategory();
      Provider.of<ReProvider>(context, listen: false).fetchRePost();
      Provider.of<ExchangeProvider>(context,listen: false).fetchExchange();
      print("Gọi lại để làm mới dữ liệu");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Consumer<AccountProvider>(
        builder: (context,dataAccount,_){
          if(dataAccount.account.idCustomer != null){
            Provider.of<BookmarkProvider>(context,listen: false).fetchBookmarkList(dataAccount.account.idCustomer!.toInt());
          }
          return PageView(
            controller: _pageController,
            children: [
              HomeScreen(isLoading: _isLoading),
              CategoryScreen(isLoading: _isLoading),
              WeatherScreen(isLoading: _isLoading),
              dataAccount.account.idCustomer != null ? const BookMarkScreen() : const LoginNotify(),
              dataAccount.account.idCustomer != null ? const ProfileScreen() : const LoginScreen()
            ],
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
          );
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            activeColor: primaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.widgets_outlined),
            title: const Text('Category'),
            activeColor: primaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.nights_stay_outlined),
            title: const Text('Weather'),
            activeColor: primaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.bookmark_border_outlined),
            title: const Text('Bookmarks'),
            activeColor: primaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.person_outline_outlined),
            title: const Text('Profile'),
            activeColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
