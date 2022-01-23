import 'package:flutter/material.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class EmptyBookmark extends StatelessWidget {
  const EmptyBookmark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 200,bottom: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: purpleLighter
              ),
              child: const Icon(Icons.comment_bank_outlined,size: 35,color: primaryColor),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              alignment: Alignment.center,
              child: const Text("You haven't saved any articles yet. Start reading and bookmarking them now",
                  textAlign: TextAlign.center,
                style: TextStyle(
                  color: blackPrimary,
                  fontFamily: FontFamily.SourceSansPro,
                  fontSize: 20
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
