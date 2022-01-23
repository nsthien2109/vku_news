import 'package:flutter/material.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class ButtonText extends StatelessWidget {
  String textButton;
  Function onClick;
  ButtonText({Key? key, required this.textButton,required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: TextButton(
          onPressed: ()=> onClick,
          child: Text(textButton,style: const TextStyle(color: greyPrimary,fontSize: 20,fontFamily: FontFamily.SourceSansPro,fontWeight: FontWeight.w400))
      ),
    );
  }
}
