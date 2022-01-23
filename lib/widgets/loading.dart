import 'package:flutter/material.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/loading.png',width: 350),
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
