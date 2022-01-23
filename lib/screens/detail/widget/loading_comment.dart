import 'package:flutter/material.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class LoadingComment extends StatelessWidget {
  const LoadingComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: greyDarker,
            strokeWidth: 2,
          ),
          SizedBox(height: 15),
          Text("Loading comment ....",style: TextStyle(color: greyDarker,fontSize: 15,fontFamily: FontFamily.SourceSansPro))
        ],
      ),
    );
  }
}
