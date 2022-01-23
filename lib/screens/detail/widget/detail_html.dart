import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';


class ReadDetail extends StatefulWidget {
  String des;
  ReadDetail({required this.des});

  @override
  _ReadDetailState createState() => _ReadDetailState();
}

class _ReadDetailState extends State<ReadDetail> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
          child: HtmlWidget(widget.des,textStyle: const TextStyle(fontSize: 20,fontFamily:FontFamily.SourceSansPro,color: greyDarker))
      ),
    );
  }
}
