import 'package:flutter/material.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class ChangeForm extends StatefulWidget {
  IconData iconForm;
  String label;
  TextEditingController controller;
  ChangeForm({
    Key? key,
    required this.iconForm,
    required this.label,
    required this.controller}) : super(key: key);

  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            suffixIcon: Icon(widget.iconForm,color: blackPrimary),
            label: Text(widget.label,style: const TextStyle(color: blackPrimary,fontSize: 18,fontFamily: FontFamily.SourceSansPro)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: purpleLighter
            )
          )
        ),
      ),
    );
  }
}
