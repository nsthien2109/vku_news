import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:vku_news/home.dart';
import 'package:vku_news/screens/login/login_screen.dart';
import 'package:vku_news/styles/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<PageViewModel> getPages(){
    return [
      PageViewModel(
        image: Image.asset('assets/images/onB1.png'),
        title: "Update news everywhere",
        body: "VKU News help you update the newspaper in the day , the weeks"
      ),
      PageViewModel(
          image: Image.asset('assets/images/onB2.png'),
          title: "Read news on Mobile",
          body: "You can reading news on your smart phone"
      ),
      PageViewModel(
          image: Image.asset('assets/images/onB3.png'),
          title: "Connect with world",
          body: "VKU News help you update the newspaper in the day , the weeks"
      ),
      PageViewModel(
          image: Image.asset('assets/images/onB4.png'),
          title: "Comments post ",
          body: "Review the post of author"
      )
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        done: const Text("Get Started"),
        onDone: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        pages: getPages(),
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        globalBackgroundColor: white,
      ),
    );
  }
}
