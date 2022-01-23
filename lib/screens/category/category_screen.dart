import 'package:flutter/material.dart';
import 'package:vku_news/screens/category/widget/list_category.dart';
import 'package:vku_news/screens/home/widget/home_header.dart';
import 'package:vku_news/widgets/loading.dart';

class CategoryScreen extends StatefulWidget {
  bool? isLoading;
  CategoryScreen({Key? key, this.isLoading}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: widget.isLoading == true ? const LoadingScreen() : SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(title: "Categories", subTitle: "Thousand of articles in each category"),
                  ListCategory(widget.isLoading)
                ],
              ),
            ),
          ),
        )
    );
  }
}
