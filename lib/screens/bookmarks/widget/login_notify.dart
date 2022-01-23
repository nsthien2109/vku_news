import 'package:flutter/material.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';
import 'package:vku_news/widgets/buttons/button_text.dart';

class LoginNotify extends StatelessWidget {
  const LoginNotify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/login.png',width: 350),
          ButtonText(textButton: "Go to Login", onClick: (){})
        ],
      ),
    );
  }
}
