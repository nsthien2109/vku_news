import 'package:flutter/material.dart';
import 'package:vku_news/styles/fonts.dart';

class BigButton extends StatefulWidget {
  String textButton;
  Function bigClick;
  Color colorButton;
  Color textColor;
  BigButton({Key? key, required this.textButton,required this.colorButton,required this.textColor,required this.bigClick}) : super(key: key);

  @override
  _BigButtonState createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  @override

  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: widget.colorButton,
            borderRadius: BorderRadius.circular(10)
        ),
        child : TextButton(
          onPressed: ()=>widget.bigClick(),
          child: Text(widget.textButton,style: TextStyle(fontSize: 20,color: widget.textColor,fontFamily: FontFamily.SourceSansPro,fontWeight: FontWeight.w600)),
        )
    );
  }
}
