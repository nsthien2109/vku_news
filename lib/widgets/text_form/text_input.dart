import 'package:flutter/material.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class InputText extends StatefulWidget {
  IconData iconForm;
  String label;
  TextEditingController controller;
  FormFieldValidator? validator;
  InputText({Key? key, required this.iconForm,required this.label,required this.controller,this.validator}) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.iconForm),
          label: Text(widget.label,style: const TextStyle(color: greyPrimary,fontSize: 18,fontFamily: FontFamily.SourceSansPro)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
    );
  }
}
