import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vku_news/styles/fonts.dart';

class ButtonIcon extends StatelessWidget {
  String textButton;
  Function onClick;
  Color colorButton;
  Color textColor;
  Image imageButton;
  ButtonIcon({Key? key, required this.textButton,required this.colorButton,required this.textColor,required this.imageButton,required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onClick,
      child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              color: colorButton,
              borderRadius: BorderRadius.circular(10)
          ),
          child : Stack(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: imageButton,
              ),
              Container(
                alignment: Alignment.center,
                  child: Text(textButton,style: TextStyle(fontSize: 20,color: textColor,fontFamily: FontFamily.SourceSansPro,fontWeight: FontWeight.w600)))
            ],
          )
      ),
    );
  }
}
